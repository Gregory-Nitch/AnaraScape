

using DataAccess.Models;
using System.Text;

namespace MapDesignLibrary;

/// <summary>
/// This class does all the random generation for map creation, but is not persisted in any data store.
/// Upon calling Generate a map design is produced, then the design information can be retrieved from
/// the public class attributes (TileMatrix, DisplayMatrix, ImageMap, Height, Width, etc.)
/// </summary>
/// <param name="height">Height of the map</param>
/// <param name="width">Width of the map</param>
/// <param name="style">Style of the map</param>
/// <param name="level">Level of the dungeon, changes algorithm behavior</param>
/// <param name="needsStairs">If true will place stairs leading down to next level</param>
/// <param name="DBTiles">Tiles from the database (accepts NOT filtered by style lists)</param>
public class MapDesign(int height, int width, string style, string level, bool needsStairs, List<DungeonTileModel> DBTiles)
{
    public int Height { get; } = height;
    public int Width { get; } = width;
    public string Style { get; } = style;
    public string Level { get; } = level;
    public bool NeedsStairs { get; } = needsStairs;

    private Random _Random { get; set; } = new Random();

    // All tiles in DB that matched passed style, ie 'fort' etc...
    private readonly List<DungeonTileModel> DBTiles = DBTiles;

    // Represents each section of the map and its current connections *3D*
    private List<List<SortedSet<string>>> ConnectionMatrix { get; } = [];
    // Represents sections in the map that should be protected from random seeding
    private SortedSet<(int row, int col)> SafetyBuffer = [];
    // Represent sections chosen to have a random tile placed in it
    private SortedSet<(int row, int col)> SeededSections = [];
    private int RequiredSeeds = 0;

    // Represents Entry point & stairs into the dungeon, -1 indicates not used/assigned
    private (int row, int col) Entrance = (-1, -1);
    private (int row, int col) StairsUp = (-1, -1);
    private (int row, int col) StairsDown = (-1, -1);

    /* Edges and corners require special handling */
    private Dictionary<string, List<(int row, int col)>> Edges = [];

    /* Outputs */
    // Represents each tile id that can fill the connection matrix above *3D*
    public List<List<List<int>>> TileMatrix { get; } = [];
    // Represents the tiles chosen for display *2D*
    public List<List<int>> DisplayMatrix { get; } = [];
    // Holds the associated filename for the output matrixes
    public Dictionary<int, string> ImageMap { get; } = [];


    /// <summary>
    /// Returns the map design as string, providing all the details needed to verify
    /// designs.
    /// </summary>
    /// <returns>String representation of the map</returns>
    public override string ToString()
    {
        StringBuilder builder = new();

        builder.AppendLine();
        builder.AppendLine("Connection Matrix");
        builder.AppendLine("---------------------------------------------------");
        builder.AppendLine();

        foreach (var row in ConnectionMatrix)
        {
            builder.Append('[');
            foreach (var col in row)
            {
                builder.Append('[');
                builder.Append(string.Join(", ", col));
                builder.Append(']');
            }
            builder.AppendLine("]\n");
        }

        builder.AppendLine();
        builder.AppendLine("Details: Seeds, Buffer, Entry|Exit");
        builder.AppendLine("---------------------------------------------------");
        builder.AppendLine();

        builder.AppendLine($"Entrance = {Entrance.row}, {Entrance.col} : (row, col)");
        builder.AppendLine($"Stairs Up = {StairsUp.row}, {StairsUp.col} : (row, col)");
        builder.AppendLine($"Stairs Down = {StairsDown.row}, {StairsDown.col} : (row, col)");

        builder.Append("Safety Buffer (row, col) = ");
        foreach (var (row, col) in SafetyBuffer)
        {
            builder.Append($"({row}, {col})");
        }
        builder.AppendLine();

        builder.AppendLine($"Required Seeds = {RequiredSeeds}");

        builder.Append("Seeded Sections (row, col) = ");
        foreach (var (row, col) in SeededSections)
        {
            builder.Append($"({row}, {col})");
        }

        builder.AppendLine();
        builder.AppendLine("Tile Matrix");
        builder.AppendLine("---------------------------------------------------");
        builder.AppendLine();

        foreach (var row in TileMatrix)
        {
            builder.Append('[');
            foreach (var col in row)
            {
                builder.Append('[');
                builder.Append(string.Join(", ", col));
                builder.Append(']');
            }
            builder.AppendLine("]\n");
        }

        builder.AppendLine();
        builder.AppendLine("Display Matrix");
        builder.AppendLine("---------------------------------------------------");
        builder.AppendLine();

        foreach (var row in DisplayMatrix)
        {
            builder.Append('[');
            builder.Append(string.Join(", ", row));
            builder.AppendLine("]\n");
        }

        return builder.ToString();
    }

    /// <summary>
    /// Called to generate a map design from the given parameters to the class constructor.
    /// </summary>
    /// <exception cref="MapDesignException">Thrown if map start cannot reach map exit (if needed)</exception>
    public void Generate()
    {
        PrepareMatrixes();

        DefineEdges();

        DefineEntryPoints();

        (int row, int col) mapStart;
        if (Level == "top")
        {
            mapStart = Entrance;
        }
        else
        {
            mapStart = StairsUp;
        }

        // Validate that the exit can be reached if there is one (fails map designs early)
        // Route is also added to SafetyBuffer by AStar
        if (NeedsStairs && !AStar(mapStart, StairsDown, true))
        {
            // Invalid design found
            throw new MapDesignException($"Error: Tile (row : {StairsDown.row}, col : {StairsDown.col}) " +
                $"could not be reached from Map Start (row : {mapStart.row}, col : {mapStart.col}). " +
                $"Printing map design...\n{this}");
        }

        // Increase SafetyBuffer around entrances (helps prevent unreachable tiles)
        IncreaseBuffer(mapStart);
        if (NeedsStairs)
        {
            IncreaseBuffer(StairsDown);
        }

        // Add seeded sections to improve randomness
        if (Height + Width > 5)
        {
            RequiredSeeds = Height + Width - 5;
        }
        for (int i = 0; i < RequiredSeeds; i++)
        {
            SeedSection();
        }

        // Complete the random design
        RandomDesign();

        // Verify that every section of the map can be reached from the entrance
        ValidateDesign(mapStart);

        // Add all valid tile ids to the TileMatrix
        FillTileMatrix();

        // Set the starting display tiles
        RandomizeDisplayMatrix();
    }

    /// <summary>
    /// Prepares the matrixes used to generate map designs.
    /// </summary>
    private void PrepareMatrixes()
    {
        for (int i = 0; i < Height; i++)
        {
            List<SortedSet<string>> row = [];
            for (int j = 0; j < Width; j++)
            {
                SortedSet<string> col = ["N"];
                row.Add(col);
            }
            ConnectionMatrix.Add(row);
        }

        for (int i = 0; i < Height; i++)
        {
            List<List<int>> row = [];
            for (int j = 0; j < Width; j++)
            {
                List<int> col = [];
                row.Add(col);
            }
            TileMatrix.Add(row);
        }

        for (int i = 0; i < Height; i++)
        {
            List<int> row = [];
            for (int j = 0; j < Width; j++)
            {
                row.Add(-1);
            }
            DisplayMatrix.Add(row);
        }
    }

    /// <summary>
    /// Defines edges of the map for future use.
    /// </summary>
    private void DefineEdges()
    {
        Edges["top"] = [];
        Edges["bottom"] = [];
        Edges["left"] = [];
        Edges["right"] = [];

        for (int i = 0; i < Height; i++)
        {
            Edges["left"].Add((i, 0));
            Edges["right"].Add((i, Width - 1));
        }

        for (int i = 0; i < Width; i++)
        {
            Edges["top"].Add((0, i));
            Edges["bottom"].Add((Height - 1, i));
        }
    }

    /// <summary>
    /// Defines the entry points for the map (ground level/stairs up/stairs down)
    /// </summary>
    private void DefineEntryPoints()
    {
        if (Level == "top")
        {
            string edge = Edges.Keys.ElementAt(_Random.Next(Edges.Count));
            Entrance = Edges[edge].ElementAt(_Random.Next(Edges[edge].Count));
            SetStackConnections(Entrance, true);
            if (NeedsStairs)
            {
                AddToSafetyBuffer(Entrance);
            }
        }
        else if (Level == "middle" || Level == "bottom")
        {
            int row = _Random.Next(Height);
            int col = _Random.Next(Width);
            StairsUp = (row, col);
            SetStackConnections(StairsUp, isStairs: "up");
            if (NeedsStairs)
            {
                AddToSafetyBuffer(StairsUp);
            }
        }

        if (NeedsStairs)
        {
            int row = _Random.Next(Height);
            int col = _Random.Next(Width);

            while ((row, col) == Entrance ||
                (row, col) == StairsUp ||
                SafetyBuffer.Contains((row, col)))
            {
                row = _Random.Next(Height);
                col = _Random.Next(Width);
            }
            StairsDown = (row, col);
            SetStackConnections(StairsDown, isStairs: "down");
            AddToSafetyBuffer(StairsDown);
        }
    }

    /// <summary>
    /// Defines the connections for any given section of the map.
    /// </summary>
    /// <param name="section">Location on the map to set connections for.</param>
    /// <param name="isEntrance">Determines if the method should treat the location as an entrance.</param>
    /// <param name="isStairs">Determines if the method should treat the location as a set of stairs and of what type.
    /// Valid entries are "up", "down", "false".</param>
    private void SetStackConnections((int row, int col) section,
                                     bool isEntrance = false,
                                     string isStairs = "false")
    {
        SortedSet<string> validConnections = [];
        SortedSet<string> requiredConnections = [];

        // Location is a stairs up or entrance on an edge or corner.
        if (isEntrance || (isStairs == "up" &&
            (Edges["top"].Contains(section) ||
            Edges["bottom"].Contains(section) ||
            Edges["right"].Contains(section) ||
            Edges["left"].Contains(section))))
        {
            if (Edges["top"].Contains(section))
            {
                validConnections.UnionWith(MapConstants.BOTTOM_CONNECTIONS);
            }
            if (Edges["bottom"].Contains(section))
            {
                validConnections.UnionWith(MapConstants.TOP_CONNECTIONS);
            }
            if (Edges["left"].Contains(section))
            {
                validConnections.UnionWith(MapConstants.RIGHT_CONNECTIONS);
            }
            if (Edges["right"].Contains(section))
            {
                validConnections.UnionWith(MapConstants.LEFT_CONNECTIONS);
            }
        }

        // Location is a stair up location but it is not on the edge.
        else if (isStairs == "up")
        {
            validConnections.UnionWith(MapConstants.BOTTOM_CONNECTIONS);
            validConnections.UnionWith(MapConstants.TOP_CONNECTIONS);
            validConnections.UnionWith(MapConstants.RIGHT_CONNECTIONS);
            validConnections.UnionWith(MapConstants.LEFT_CONNECTIONS);
        }

        // Otherwise it is a stairs down or regular section.
        else
        {
            GetNeighboringConnections(section, validConnections, requiredConnections);
        }

        ConnectionMatrix[section.row][section.col] = GetFinalConnectionState(validConnections,
                                                                             requiredConnections,
                                                                             isEntrance,
                                                                             isStairs);
    }

    /// <summary>
    /// Adds the required sections to the safety buffer used to prevent map design flaws.
    /// </summary>
    /// <param name="section">Section to protect.</param>
    private void AddToSafetyBuffer((int row, int col) section)
    {
        (int row, int col) = section;
        SortedSet<string> sectionConnections = ConnectionMatrix[row][col];

        // If section is in corner, use of First() to only get connection direction in the map
        if (section == (0, 0)) // Top left
        {
            if (sectionConnections.First().Contains('R'))
            {
                SafetyBuffer.Add((row, col + 1));
                SafetyBuffer.Add((row + 1, col + 1));
            }

            else if (sectionConnections.First().Contains('B'))
            {
                SafetyBuffer.Add((row + 1, col));
                SafetyBuffer.Add((row + 1, col + 1));
            }

            return;
        }
        else if (section == (0, Width - 1)) // Top right
        {
            if (sectionConnections.First().Contains('L'))
            {
                SafetyBuffer.Add((row, col - 1));
                SafetyBuffer.Add((row + 1, col - 1));
            }

            else if (sectionConnections.First().Contains('B'))
            {
                SafetyBuffer.Add((row + 1, col));
                SafetyBuffer.Add((row + 1, col - 1));
            }

            return;
        }
        else if (section == (Height - 1, 0)) // Bottom left
        {
            if (sectionConnections.First().Contains('R'))
            {
                SafetyBuffer.Add((row, col + 1));
                SafetyBuffer.Add((row - 1, col + 1));
            }

            else if (sectionConnections.First().Contains('T'))
            {
                SafetyBuffer.Add((row - 1, col));
                SafetyBuffer.Add((row - 1, col + 1));
            }

            return;
        }
        else if (section == (Height - 1, Width - 1)) // Bottom right
        {
            if (sectionConnections.First().Contains('L'))
            {
                SafetyBuffer.Add((row, col - 1));
                SafetyBuffer.Add((row - 1, col - 1));
            }

            else if (sectionConnections.First().Contains('T'))
            {
                SafetyBuffer.Add((row - 1, col));
                SafetyBuffer.Add((row - 1, col - 1));
            }

            return;
        }

        // Else if a section is on an edge
        if (Edges["top"].Contains(section))
        {
            if (sectionConnections.First().Contains('B'))
            {
                SafetyBuffer.Add((row + 1, col - 1));
                SafetyBuffer.Add((row + 1, col));
                SafetyBuffer.Add((row + 1, col + 1));
            }

            else if (sectionConnections.First().Contains('L'))
            {
                SafetyBuffer.Add((row, col - 1));
                SafetyBuffer.Add((row + 1, col - 1));
            }

            else if (sectionConnections.First().Contains('R'))
            {
                SafetyBuffer.Add((row, col + 1));
                SafetyBuffer.Add((row + 1, col + 1));
            }
        }
        else if (Edges["bottom"].Contains(section))
        {
            if (sectionConnections.First().Contains('T'))
            {
                SafetyBuffer.Add((row - 1, col - 1));
                SafetyBuffer.Add((row - 1, col));
                SafetyBuffer.Add((row - 1, col + 1));
            }

            else if (sectionConnections.First().Contains('L'))
            {
                SafetyBuffer.Add((row, col - 1));
                SafetyBuffer.Add((row - 1, col - 1));
            }

            else if (sectionConnections.First().Contains('R'))
            {
                SafetyBuffer.Add((row, col + 1));
                SafetyBuffer.Add((row - 1, col + 1));
            }
        }
        else if (Edges["left"].Contains(section))
        {
            if (sectionConnections.First().Contains('T'))
            {
                SafetyBuffer.Add((row - 1, col));
                SafetyBuffer.Add((row - 1, col + 1));
            }

            else if (sectionConnections.First().Contains('B'))
            {
                SafetyBuffer.Add((row + 1, col));
                SafetyBuffer.Add((row + 1, col + 1));
            }

            else if (sectionConnections.First().Contains('R'))
            {
                SafetyBuffer.Add((row - 1, col + 1));
                SafetyBuffer.Add((row, col + 1));
                SafetyBuffer.Add((row + 1, col + 1));
            }
        }
        else if (Edges["right"].Contains(section))
        {
            if (sectionConnections.First().Contains('T'))
            {
                SafetyBuffer.Add((row - 1, col));
                SafetyBuffer.Add((row - 1, col - 1));
            }

            else if (sectionConnections.First().Contains('B'))
            {
                SafetyBuffer.Add((row + 1, col));
                SafetyBuffer.Add((row + 1, col - 1));
            }

            else if (sectionConnections.First().Contains('L'))
            {
                SafetyBuffer.Add((row - 1, col - 1));
                SafetyBuffer.Add((row, col - 1));
                SafetyBuffer.Add((row + 1, col - 1));
            }
        }
        // Not on an edge and requires full safe zone
        else
        {
            if (sectionConnections.First().Contains('T'))
            {
                SafetyBuffer.Add((row - 1, col - 1));
                SafetyBuffer.Add((row - 1, col));
                SafetyBuffer.Add((row - 1, col + 1));
            }

            else if (sectionConnections.First().Contains('B'))
            {
                SafetyBuffer.Add((row + 1, col - 1));
                SafetyBuffer.Add((row + 1, col));
                SafetyBuffer.Add((row + 1, col + 1));
            }

            else if (sectionConnections.First().Contains('L'))
            {
                SafetyBuffer.Add((row - 1, col - 1));
                SafetyBuffer.Add((row, col - 1));
                SafetyBuffer.Add((row + 1, col - 1));
            }

            else if (sectionConnections.First().Contains('R'))
            {
                SafetyBuffer.Add((row - 1, col + 1));
                SafetyBuffer.Add((row, col + 1));
                SafetyBuffer.Add((row + 1, col + 1));
            }
        }
    }

    /// <summary>
    /// Looks at the neighboring connections of the map and adds or removes connections from the passed valid
    /// connections if use of those connections are valid or would produce a flaw in map design.
    /// </summary>
    /// <param name="section">Section to prune connections from.</param>
    /// <param name="validConnections">Connection set to prune connections from.</param>
    private void GetNeighboringConnections((int row, int col) section,
                                           SortedSet<string> validConnections,
                                           SortedSet<string> requiredConnections)
    {
        // Set neighbors
        (int row, int col) indexUp = (section.row - 1, section.col);
        (int row, int col) indexDown = (section.row + 1, section.col);
        (int row, int col) indexLeft = (section.row, section.col - 1);
        (int row, int col) indexRight = (section.row, section.col + 1);
        (int row, int col) indexDownAndRight = (section.row + 1, section.col + 1);
        List<(int row, int col)> neighbors =
        [
            indexUp,
            indexDown,
            indexLeft,
            indexRight,
            indexDownAndRight
        ];

        foreach (var neighbor in neighbors)
        {
            // Skip neighbors outside of the map
            if (neighbor.row > Height - 1
                || neighbor.row < 0
                || neighbor.col > Width - 1
                || neighbor.col < 0)
            {
                continue;
            }

            SortedSet<string> incomingConnections = ConnectionMatrix[neighbor.row][neighbor.col];

            // If incoming connection == "N" all connections are valid in that direction
            if (incomingConnections.First() == "N")
            {
                if (neighbor == indexUp)
                {
                    validConnections.UnionWith(MapConstants.TOP_CONNECTIONS);
                }
                else if (neighbor == indexDown)
                {
                    validConnections.UnionWith(MapConstants.BOTTOM_CONNECTIONS);
                }
                else if (neighbor == indexLeft)
                {
                    validConnections.UnionWith(MapConstants.LEFT_CONNECTIONS);
                }
                else if (neighbor == indexRight)
                {
                    validConnections.UnionWith(MapConstants.RIGHT_CONNECTIONS);
                }
            }

            // If incoming connection == "E" tile no connections are valid (empty tile)
            else if (incomingConnections.First() == "E")
            {
                // If tile is down and right remove B7 and R7 if in valid connections, prevents large room tiles
                if (neighbor == indexDownAndRight)
                {
                    validConnections.Remove("B7");
                    validConnections.Remove("R7");
                }
                else
                {
                    continue;
                }
            }

            // Handle down and right index separately
            else if (neighbor == indexDownAndRight)
            {
                // If it is a large tile with a top left connection add the required bottom right connections
                if (incomingConnections.Contains("T0") && incomingConnections.Contains("L0"))
                {
                    requiredConnections.Add("B7");
                    requiredConnections.Add("R7");
                }
                // Else remove bottom right connections from valid connections
                else
                {
                    validConnections.Remove("B7");
                    validConnections.Remove("R7");
                }
            }

            // Else for each incoming connection add the mating connection to required connections
            foreach (var connection in incomingConnections)
            {
                // But only if the connection is in the direction of the current section
                if (neighbor == indexUp && connection.Contains('B'))
                {
                    requiredConnections.Add(MapConstants.MATING_CONNECTIONS[connection]);
                }
                else if (neighbor == indexDown && connection.Contains('T'))
                {
                    requiredConnections.Add(MapConstants.MATING_CONNECTIONS[connection]);
                }
                else if (neighbor == indexLeft && connection.Contains('R'))
                {
                    requiredConnections.Add(MapConstants.MATING_CONNECTIONS[connection]);
                }
                else if (neighbor == indexRight && connection.Contains('L'))
                {
                    requiredConnections.Add(MapConstants.MATING_CONNECTIONS[connection]);
                }
            }
        }

    }

    /// <summary>
    /// Used to assign the final connection state of any given map section.
    /// </summary>
    /// <param name="validConnections">The valid connections determined available to the section.</param>
    /// <param name="requiredConnections">The required connections determined for the section.</param>
    /// <param name="isEntrance">Determines if the method should treat the location as an entrance.</param>
    /// <param name="isStairs">Determines if the method should treat the locations as stairs. Valid
    /// inputs are "up", "down", "false".</param>
    private SortedSet<string> GetFinalConnectionState(SortedSet<string> validConnections,
                                         SortedSet<string> requiredConnections,
                                         bool isEntrance = false,
                                         string isStairs = "false")
    {
        List<DungeonTileModel> matchedTiles = [];

        foreach (var tile in DBTiles)
        {
            // If there are required connections and not all are met then continue to next tile.
            // Filter tiles that do not meet the entrance and stair requirements
            if ((requiredConnections.Count != 0 && !requiredConnections.IsSubsetOf(tile.Connections)) ||
                    tile.IsEntrance != isEntrance || tile.IsStairs != isStairs)
            {
                continue;
            }

            // No requirements, not entrance, not stairs means empty tile "E" is valid
            else if (requiredConnections.Count == 0
                     && isEntrance == false
                     && isStairs == "false"
                     && tile.Connections.FirstOrDefault() == "E")
            {
                // Pad 5 empty tiles for added randomness to maps
                for (int i = 0; i < 5; i++)
                {
                    matchedTiles.Add(tile);
                }
            }

            bool tileMatches = true;// Switches to false if a connection is missing
            // If all connection requirements are met add tile to matched tiles
            foreach (var connection in tile.Connections)
            {
                if (!validConnections.Contains(connection) && !requiredConnections.Contains(connection))
                {
                    tileMatches = false;
                    break;
                }
            }

            if (tileMatches)
            {
                matchedTiles.Add(tile);
            }
        }

        DungeonTileModel chosenTile = matchedTiles.ElementAt(_Random.Next(matchedTiles.Count));
        return chosenTile.Connections;
    }

    /// <summary>
    /// A* search algorithm for validating map designs, false return == invalid design.
    /// </summary>
    /// <param name="start">Starting node for A* search</param>
    /// <param name="target">Target node for A* search</param>
    /// <param name="protectRoute">If true all nodes on route to the target will be added to the SafetyBuffer</param>
    /// <returns>bool: can reach the target = true, cannot = false</returns>
    private bool AStar((int row, int col) start, (int row, int col) target, bool protectRoute = false)
    {
        HashSet<(int row, int col)> explored = [];
        HashSet<Node> frontier = [];
        Node startNode = new(start, null, 0, target);
        bool solved = false;
        frontier.Add(startNode);

        // Until a route to the exit has been found search for exit
        while (!solved)
        {
            // Frontier is empty, there is not route to the target (invalid design)
            Node? node = frontier.FirstOrDefault();
            if (node == null)
            {
                return false;
            }
            frontier.Remove(node);

            // If current state == target solution has been found (valid design)
            if (node.State == target)
            {
                // If needed add route to SafetyBuffer (entrance/stairs up to stairs down)
                if (protectRoute)
                {
                    HashSet<(int row, int col)> route = [];
                    while (node.Parent != null)
                    {
                        route.Add(node.State);
                        node = node.Parent;
                    }

                    foreach (var section in route)
                    {
                        SafetyBuffer.Add(section);
                    }
                }

                return true;
            }

            // Otherwise continue exploring
            explored.Add(node.State);
            foreach (var candidate in AStarNeighbors(node, target))
            {
                if (!explored.Contains(candidate.State) && !frontier.Any(n => n.State == candidate.State))
                {
                    frontier.Add(candidate);
                }
            }

            frontier = [.. frontier.OrderBy(n => n.Cost)];
        }

        // Should be unreachable, while loop will return false when frontier is exhausted
        return false;
    }

    /// <summary>
    /// Gets the neighboring valid nodes (has connections) and returns the set ordered by lowest cost.
    /// </summary>
    /// <param name="state">Current state to get neighbors for</param>
    /// <param name="cost">Cost of current state</param>
    /// <returns>HashSet of type Node that is ordered by cost ascending</returns>
    /// <exception cref="NotImplementedException"></exception>
    private HashSet<Node> AStarNeighbors(Node currentNode, (int row, int col) target)
    {
        (int row, int col) = currentNode.State;
        SortedSet<string> stateConnections = ConnectionMatrix[row][col];
        HashSet<Node> neighbors = [
            new Node((row - 1, col), currentNode, currentNode.Cost + 1, target), // Up
            new Node((row + 1, col), currentNode, currentNode.Cost + 1, target), // Down
            new Node((row, col - 1), currentNode, currentNode.Cost + 1, target), // Left
            new Node((row, col + 1), currentNode, currentNode.Cost + 1, target) // Down
            ];

        neighbors = [.. neighbors.OrderBy(n => n.Cost)];

        // Filter neighbors out of bounds
        foreach (var neighbor in neighbors)
        {
            (int nRow, int nCol) = neighbor.State;
            if (nRow < 0 || nRow > Height - 1 || nCol < 0 || nCol > Width - 1)
            {
                neighbors.Remove(neighbor);
            }
        }

        // If current state is a null tile, return all neighbors
        if (stateConnections.First() == "N")
        {
            return neighbors;
        }

        // Filter by outbound connections of the current state
        if (!stateConnections.Any(c => c.Contains('T'))) // Up needs T connections
        {
            neighbors.RemoveWhere(n => n.State == (row - 1, col));
        }
        if (!stateConnections.Any(c => c.Contains('B'))) // Down needs B connections
        {
            neighbors.RemoveWhere(n => n.State == (row + 1, col));
        }
        if (!stateConnections.Any(c => c.Contains('L'))) // Left needs L connections
        {
            neighbors.RemoveWhere(n => n.State == (row, col - 1));
        }
        if (!stateConnections.Any(c => c.Contains('R'))) // Right needs R connections
        {
            neighbors.RemoveWhere(n => n.State == (row, col + 1));
        }

        //Filter by inbound connections of neighbors
        foreach (var neighbor in neighbors)
        {
            (int nRow, int nCol) = neighbor.State;
            SortedSet<string> neighborConnections = ConnectionMatrix[nRow][nCol];

            // If neighbor is currently null then it is considered valid to enter
            if (neighborConnections.Contains("N"))
            {
                continue;
            }

            // Tile up needs bottom connections
            if (row - 1 == nRow && !neighborConnections.Any(c => c.Contains('B')))
            {
                neighbors.Remove(neighbor);
            }

            // Tile down needs top connections
            else if (row + 1 == nRow && !neighborConnections.Any(c => c.Contains('T')))
            {
                neighbors.Remove(neighbor);
            }

            // Tile left needs right connections
            else if (col - 1 == nCol && !neighborConnections.Any(c => c.Contains('R')))
            {
                neighbors.Remove(neighbor);
            }

            // Tile right needs left connections
            else if (col + 1 == nCol && !neighborConnections.Any(c => c.Contains('L')))
            {
                neighbors.Remove(neighbor);
            }

            // Tile is "E" empty no valid connections
            else if (neighborConnections.First() == "E")
            {
                neighbors.Remove(neighbor);
            }
        }

        return neighbors;
    }

    /// <summary>
    /// Increases the SafetyBuffer around the provided section, helps prevent invalid map designs during
    /// seeding and random tile selection. Adjacent tiles are also added to the buffer.
    /// </summary>
    /// <param name="section">The section to protect</param>
    private void IncreaseBuffer((int row, int col) section)
    {
        (int row, int col) = section;
        List<(int row, int col)> neighborsToAdd = [
            (row-1, col-1),// Starting clockwise from top left neighbor
            (row-1, col),
            (row-1, col+1),
            (row, col+1),
            (row+1, col+1),
            (row+1, col),
            (row+1, col-1),
            (row, col-1)
            ];

        foreach (var neighbor in neighborsToAdd)
        {
            (int nRow, int nCol) = neighbor;
            // Filter out of bounds neighbors
            if (nRow < 0 || nRow > Height - 1 || nCol < 0 || nCol > Width - 1)
            {
                continue;
            }
            // Otherwise add to buffer
            SafetyBuffer.Add(neighbor);
        }

    }

    /// <summary>
    /// Randomly choose a section outside of the SafetyBuffer and assigns it connections
    /// regardless of what tiles are around it, then adds areas around the seeded section
    /// to the SafetyBuffer (Helps prevent unreachable tiles). Will abort if it cannot
    /// find a section outside of the entry buffer after 10 tries.
    /// </summary>
    private void SeedSection()
    {
        SortedSet<string> validConnections = [];
        SortedSet<string> requiredConnections = [];
        // Initial random section
        (int row, int col) seed = (_Random.Next(Height), _Random.Next(Width));
        int failures = 0;

        // Ensure section is not in SafetyBuffer, SeededSections, is an entrance, is a stair
        while (SafetyBuffer.Contains(seed)
            || SeededSections.Contains(seed)
            || Entrance == seed
            || StairsUp == seed
            || StairsDown == seed)
        {
            seed = (_Random.Next(Height), _Random.Next(Width));
            failures++;
            if (failures > 9)
            {
                return;// Could not find a safe section to seed randomly
            }
        }

        SeededSections.Add(seed);
        IncreaseBuffer(seed);
        GetNeighboringConnections(seed, validConnections, requiredConnections);
        ConnectionMatrix[seed.row][seed.col] = GetFinalConnectionState(validConnections,
                                                                     requiredConnections
                                                                     );
    }

    /// <summary>
    /// Fills in the remaining sections with randomly connected and chosen tiles.
    /// </summary>
    private void RandomDesign()
    {
        for (int row = 0; row < Height; row++)
        {
            for (int col = 0; col < Width; col++)
            {
                if (ConnectionMatrix[row][col].First() == "N")
                {
                    SortedSet<string> validConnections = [];
                    SortedSet<string> requiredConnections = [];
                    (int row, int col) section = (row, col);
                    GetNeighboringConnections(section, validConnections, requiredConnections);
                    validConnections = RandomDesignQuery(validConnections, requiredConnections);
                    ConnectionMatrix[row][col] = validConnections;
                }
            }
        }
    }

    /// <summary>
    /// Queries the database to return tile connection that connect in every direction
    /// listed in valid connections but forces connections to required connections.
    /// </summary>
    /// <param name="validConnections">Connections the section can have</param>
    /// <param name="requiredConnections">Connections the section must have</param>
    private SortedSet<string> RandomDesignQuery(SortedSet<string> validConnections, SortedSet<string> requiredConnections)
    {
        bool needTop = false;
        bool needBottom = false;
        bool needRight = false;
        bool needLeft = false;

        // Check valid connections for required directions to connect all tiles
        if (validConnections.Any(c => c.Contains('T')))
        {
            needTop = true;
        }
        if (validConnections.Any(c => c.Contains('B')))
        {
            needBottom = true;
        }
        if (validConnections.Any(c => c.Contains('L')))
        {
            needLeft = true;
        }
        if (validConnections.Any(c => c.Contains('R')))
        {
            needRight = true;
        }

        List<DungeonTileModel> dbRegularTiles = DBTiles.Where(t => t.IsEntrance == false && t.IsStairs == "false").ToList();

        List<DungeonTileModel> matchedTiles = [];

        foreach (var tile in dbRegularTiles)
        {
            SortedSet<string> tileConnections = tile.Connections;

            // If section has required connections that are not met by the tile continue to the next
            if (requiredConnections.Count != 0 && !requiredConnections.IsSubsetOf(tileConnections))
            {
                continue;
            }

            // If a direction is required but not contained in tile connections continue to the next
            if (needTop && !tileConnections.Any(c => c.Contains('T')))
            {
                continue;
            }
            if (needBottom && !tileConnections.Any(c => c.Contains('B')))
            {
                continue;
            }
            if (needLeft && !tileConnections.Any(c => c.Contains('L')))
            {
                continue;
            }
            if (needRight && !tileConnections.Any(c => c.Contains('R')))
            {
                continue;
            }

            bool tileMatches = true;// Switches to false if a connection is missing
            // If all connection requirements are met add tile to matched tiles
            foreach (var connection in tile.Connections)
            {
                if (!validConnections.Contains(connection) && !requiredConnections.Contains(connection))
                {
                    tileMatches = false;
                    break;
                }
            }

            if (tileMatches)
            {
                matchedTiles.Add(tile);
            }
        }

        if (matchedTiles.Count > 0)
        {
            DungeonTileModel chosenTile = matchedTiles.ElementAt(_Random.Next(matchedTiles.Count));
            return chosenTile.Connections;
        }
        // If there are no valid tiles place an empty tile
        else
        {
            return ["E"];
        }
    }

    /// <summary>
    /// Ensures that every tile on the map is reachable from the entrance, but skips "E" empty tiles
    /// and iterations that have the entrance as the target.
    /// </summary>
    /// <param name="mapStart">Entrance for the current map</param>
    /// <exception cref="MapDesignException">Thrown if unreachable tile found</exception>
    private void ValidateDesign((int row, int col) mapStart)
    {
        for (int row = 0; row < Height; row++)
        {
            for (int col = 0; col < Width; col++)
            {
                // Skip start and empty target tiles
                if ((row, col) == mapStart || ConnectionMatrix[row][col].First() == "E")
                {
                    continue;
                }

                // If AStar fails raise map design exception
                if (!AStar(mapStart, (row, col)))
                {
                    throw new MapDesignException($"Error: Tile (row : {row}, col : {col}) " +
                $"could not be reached from Map Start (row : {mapStart.row}, col : {mapStart.col}). " +
                $"Printing map design...\n{this}");
                }
            }
        }
    }

    /// <summary>
    /// Fills the TileMatrix with all valid tile ids based on connections listed in the
    /// ConnectionMatrix and inputs their respective Id and Filename into the ImageMap
    /// by iterating over every map section.
    /// </summary>
    private void FillTileMatrix()
    {
        for (int row = 0; row < Height; row++)
        {
            for (int col = 0; col < Width; col++)
            {
                SortedSet<string> requiredConnections = ConnectionMatrix[row][col];
                List<DungeonTileModel> validTiles = [];

                // Filter tiles by connections and settings
                if ((row, col) == Entrance)
                {
                    validTiles = DBTiles.Where(t => t.IsEntrance == true && t.Connections
                                        .SequenceEqual(requiredConnections))
                                        .ToList();
                }
                else if ((row, col) == StairsUp)
                {
                    validTiles = DBTiles.Where(t => t.IsStairs == "up" && t.Connections
                                        .SequenceEqual(requiredConnections))
                                        .ToList();
                }
                else if ((row, col) == StairsDown)
                {
                    validTiles = DBTiles.Where(t => t.IsStairs == "down" && t.Connections
                                        .SequenceEqual(requiredConnections))
                                        .ToList();
                }
                else
                {
                    validTiles = DBTiles.Where(t => t.IsEntrance == false && t.IsStairs == "false" && t.Connections
                                        .SequenceEqual(requiredConnections))
                                        .ToList();
                }

                // Add all valid ids and images to TileMatrix and ImageMap
                List<int> validIds = [];
                foreach (var tile in validTiles)
                {
                    TileMatrix[row][col].Add(tile.Id);
                    ImageMap.TryAdd(tile.Id, tile.Filename);
                }
            }
        }
    }

    /// <summary>
    /// Randomly picks a tile id from each tile in the TileMatrix and puts it in
    /// the DisplayMatrix.
    /// </summary>
    private void RandomizeDisplayMatrix()
    {
        for (int row = 0; row < Height; row++)
        {
            for (int col = 0; col < Width; col++)
            {
                int randomId = TileMatrix[row][col].ElementAt(_Random.Next(TileMatrix[row][col].Count));
                DisplayMatrix[row][col] = randomId;
            }
        }
    }
}
