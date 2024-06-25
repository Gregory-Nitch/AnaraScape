
using DataAccess.Models;

namespace MapDesignLibrary;

/// <summary>
/// This class does all the random generation for map creation, but is not persisted in any data
/// store. Upon calling Generate a MapDesign is produced, then the design information can be
/// retrieved from the class attributes (TileMatrix, DisplayMatrix, ImageMap, etc.)
/// </summary>
/// <param name="height">Height of the map</param>
/// <param name="width">Width of the map</param>
/// <param name="style">Style of the map</param>
/// <param name="level">Level of the dungeon, changes algorithm behavior</param>
/// <param name="needsStairs">If true will place stairs leading down to next level</param>
/// <param name="DBTiles">Tiles from the database (NOT filtered)</param>
public class MapDesigner(int height,
                       int width,
                       string style,
                       string level,
                       bool needsStairs,
                       List<DungeonTileModel> DBTiles)
{
    public int Height { get; } = height;
    public int Width { get; } = width;
    public string Style { get; } = style;
    public string Level { get; } = level;
    public bool NeedsStairs { get; } = needsStairs;

    private Random _Random { get; set; } = new Random();

    // All tiles in DB that matched passed style, ie 'fort' etc...
    private readonly List<DungeonTileModel> DBTiles = DBTiles.Where(t => t.Style == style).ToList();
    private readonly DungeonTileModel EmptyTile = DBTiles
                                                  .Where(x => x.Connections.First() == "E")
                                                  .First();

    // Design to be worked on, instance created in 'Generate()'
    private MapDesign Design;


    /// <summary>
    /// Called to generate a map design from the given parameters to the class constructor.
    /// </summary>
    /// <exception cref="MapDesignException">Thrown if map start cannot reach map exit (if needed)
    /// </exception>
    public MapDesign Generate()
    {
        Design = new();

        InitializeDataSets();

        DefineEntryPoints();

        (int row, int col) mapStart;
        if (Level == "top")
        {
            mapStart = Design.Entrance;
        }
        else
        {
            mapStart = Design.StairsUp;
        }
        ProtectWithSafetyBuffer(mapStart);

        // Validate that the exit can be reached if there is one (fails map designs early)
        // Route is also added to SafetyBuffer by AStar
        if (NeedsStairs && !AStar(mapStart, Design.StairsDown, true))
        {
            // Invalid design found
            throw new MapDesignException($"Error: Tile (row : {Design.StairsDown.row}, col : " +
            $"{Design.StairsDown.col}) could not be reached from Map Start (row : {mapStart.row}, " +
            $"col : {mapStart.col}). Printing map design...\n{Design}");
        }

        // Add seeded sections to improve randomness
        if (Height + Width > 5)
        {
            Design.RequiredSeeds = Height + Width - 5;
        }
        for (int i = 0; i < Design.RequiredSeeds; i++)
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

        return Design;
    }

    /// <summary>
    /// Prepares the matrixes and edge map used to generate map designs.
    /// </summary>
    private void InitializeDataSets()
    {
        Design.Edges["top"] = [];
        Design.Edges["bottom"] = [];
        Design.Edges["left"] = [];
        Design.Edges["right"] = [];

        for (int i = 0; i < Height; i++)
        {
            List<SortedSet<string>> connectionRow = [];
            List<List<int>> tileRow = [];
            List<int> displayRow = [];
            Design.Edges["left"].Add((i, 0));
            Design.Edges["right"].Add((i, Width - 1));
            for (int j = 0; j < Width; j++)
            {
                SortedSet<string> connectionCol = ["N"];
                connectionRow.Add(connectionCol);
                List<int> tileCol = [];
                tileRow.Add(tileCol);
                displayRow.Add(-1);
                if (i == 0) // Prevents edge duplicates in 'top' & 'bottom' edge map
                {
                    Design.Edges["top"].Add((0, j));
                    Design.Edges["bottom"].Add((Height - 1, j));
                }
            }
            Design.ConnectionMatrix.Add(connectionRow);
            Design.TileMatrix.Add(tileRow);
            Design.DisplayMatrix.Add(displayRow);
        }
    }

    /// <summary>
    /// Defines the entry points for the map (ground level/stairs up/stairs down)
    /// </summary>
    private void DefineEntryPoints()
    {
        if (Level == "top")
        {
            string edge = Design.Edges.Keys.ElementAt(_Random.Next(Design.Edges.Count));
            Design.Entrance = Design.Edges[edge].ElementAt(_Random.Next(Design.Edges[edge].Count));
            SetStackConnections(Design.Entrance, true);
            AddEntranceSafetyBuffer(Design.Entrance);
        }
        else if (Level == "middle" || Level == "bottom")
        {
            int row = _Random.Next(Height);
            int col = _Random.Next(Width);
            Design.StairsUp = (row, col);
            SetStackConnections(Design.StairsUp, isStairs: "up");
            AddEntranceSafetyBuffer(Design.StairsUp);
        }

        if (NeedsStairs)
        {
            int row = _Random.Next(Height);
            int col = _Random.Next(Width);

            while ((row, col) == Design.Entrance ||
                (row, col) == Design.StairsUp ||
                Design.SafetyBuffer.Contains((row, col)))
            {
                row = _Random.Next(Height);
                col = _Random.Next(Width);
            }
            Design.StairsDown = (row, col);
            SetStackConnections(Design.StairsDown, isStairs: "down");
            ProtectWithSafetyBuffer(Design.StairsDown);
        }
    }

    /// <summary>
    /// Adds the required sections around the entrance section to prevent map design flaws.
    /// </summary>
    /// <param name="section">Entrance section to protect.</param>
    private void AddEntranceSafetyBuffer((int row, int col) section)
    {
        (int row, int col) = section;
        SortedSet<string> sectionConnections = Design.ConnectionMatrix[row][col];

        // If section is in corner, use of First() to only get connection direction in the map
        if (section == (0, 0)) // Top left
        {
            if (sectionConnections.First().Contains('R'))
            {
                Design.SafetyBuffer.Add((row, col + 1));
                Design.SafetyBuffer.Add((row + 1, col + 1));
            }

            else if (sectionConnections.First().Contains('B'))
            {
                Design.SafetyBuffer.Add((row + 1, col));
                Design.SafetyBuffer.Add((row + 1, col + 1));
            }

            return;
        }
        else if (section == (0, Width - 1)) // Top right
        {
            if (sectionConnections.First().Contains('L'))
            {
                Design.SafetyBuffer.Add((row, col - 1));
                Design.SafetyBuffer.Add((row + 1, col - 1));
            }

            else if (sectionConnections.First().Contains('B'))
            {
                Design.SafetyBuffer.Add((row + 1, col));
                Design.SafetyBuffer.Add((row + 1, col - 1));
            }

            return;
        }
        else if (section == (Height - 1, 0)) // Bottom left
        {
            if (sectionConnections.First().Contains('R'))
            {
                Design.SafetyBuffer.Add((row, col + 1));
                Design.SafetyBuffer.Add((row - 1, col + 1));
            }

            else if (sectionConnections.First().Contains('T'))
            {
                Design.SafetyBuffer.Add((row - 1, col));
                Design.SafetyBuffer.Add((row - 1, col + 1));
            }

            return;
        }
        else if (section == (Height - 1, Width - 1)) // Bottom right
        {
            if (sectionConnections.First().Contains('L'))
            {
                Design.SafetyBuffer.Add((row, col - 1));
                Design.SafetyBuffer.Add((row - 1, col - 1));
            }

            else if (sectionConnections.First().Contains('T'))
            {
                Design.SafetyBuffer.Add((row - 1, col));
                Design.SafetyBuffer.Add((row - 1, col - 1));
            }

            return;
        }

        // Else if a section is on an edge
        if (Design.Edges["top"].Contains(section))
        {
            if (sectionConnections.First().Contains('B'))
            {
                Design.SafetyBuffer.Add((row + 1, col - 1));
                Design.SafetyBuffer.Add((row + 1, col));
                Design.SafetyBuffer.Add((row + 1, col + 1));
            }

            else if (sectionConnections.First().Contains('L'))
            {
                Design.SafetyBuffer.Add((row, col - 1));
                Design.SafetyBuffer.Add((row + 1, col - 1));
            }

            else if (sectionConnections.First().Contains('R'))
            {
                Design.SafetyBuffer.Add((row, col + 1));
                Design.SafetyBuffer.Add((row + 1, col + 1));
            }
        }
        else if (Design.Edges["bottom"].Contains(section))
        {
            if (sectionConnections.First().Contains('T'))
            {
                Design.SafetyBuffer.Add((row - 1, col - 1));
                Design.SafetyBuffer.Add((row - 1, col));
                Design.SafetyBuffer.Add((row - 1, col + 1));
            }

            else if (sectionConnections.First().Contains('L'))
            {
                Design.SafetyBuffer.Add((row, col - 1));
                Design.SafetyBuffer.Add((row - 1, col - 1));
            }

            else if (sectionConnections.First().Contains('R'))
            {
                Design.SafetyBuffer.Add((row, col + 1));
                Design.SafetyBuffer.Add((row - 1, col + 1));
            }
        }
        else if (Design.Edges["left"].Contains(section))
        {
            if (sectionConnections.First().Contains('T'))
            {
                Design.SafetyBuffer.Add((row - 1, col));
                Design.SafetyBuffer.Add((row - 1, col + 1));
            }

            else if (sectionConnections.First().Contains('B'))
            {
                Design.SafetyBuffer.Add((row + 1, col));
                Design.SafetyBuffer.Add((row + 1, col + 1));
            }

            else if (sectionConnections.First().Contains('R'))
            {
                Design.SafetyBuffer.Add((row - 1, col + 1));
                Design.SafetyBuffer.Add((row, col + 1));
                Design.SafetyBuffer.Add((row + 1, col + 1));
            }
        }
        else if (Design.Edges["right"].Contains(section))
        {
            if (sectionConnections.First().Contains('T'))
            {
                Design.SafetyBuffer.Add((row - 1, col));
                Design.SafetyBuffer.Add((row - 1, col - 1));
            }

            else if (sectionConnections.First().Contains('B'))
            {
                Design.SafetyBuffer.Add((row + 1, col));
                Design.SafetyBuffer.Add((row + 1, col - 1));
            }

            else if (sectionConnections.First().Contains('L'))
            {
                Design.SafetyBuffer.Add((row - 1, col - 1));
                Design.SafetyBuffer.Add((row, col - 1));
                Design.SafetyBuffer.Add((row + 1, col - 1));
            }
        }
        // Not on an edge and requires full safe zone
        else
        {
            if (sectionConnections.First().Contains('T'))
            {
                Design.SafetyBuffer.Add((row - 1, col - 1));
                Design.SafetyBuffer.Add((row - 1, col));
                Design.SafetyBuffer.Add((row - 1, col + 1));
            }

            else if (sectionConnections.First().Contains('B'))
            {
                Design.SafetyBuffer.Add((row + 1, col - 1));
                Design.SafetyBuffer.Add((row + 1, col));
                Design.SafetyBuffer.Add((row + 1, col + 1));
            }

            else if (sectionConnections.First().Contains('L'))
            {
                Design.SafetyBuffer.Add((row - 1, col - 1));
                Design.SafetyBuffer.Add((row, col - 1));
                Design.SafetyBuffer.Add((row + 1, col - 1));
            }

            else if (sectionConnections.First().Contains('R'))
            {
                Design.SafetyBuffer.Add((row - 1, col + 1));
                Design.SafetyBuffer.Add((row, col + 1));
                Design.SafetyBuffer.Add((row + 1, col + 1));
            }
        }
    }

    /// <summary>
    /// Defines the connections for any given section of the map.
    /// </summary>
    /// <param name="section">Location on the map to set connections for.</param>
    /// <param name="isEntrance">Determines if the method should treat the location as an entrance.
    /// </param>
    /// <param name="isStairs">Determines if the method should treat the location as a set of stairs 
    /// and of what type. Valid entries are "up", "down", "false".</param>
    private void SetStackConnections((int row, int col) section,
                                     bool isEntrance = false,
                                     string isStairs = "false")
    {
        SortedSet<string> validConnections = [];
        SortedSet<string> requiredConnections = [];

        // Location is a stairs up or entrance on an edge or corner.
        if (isEntrance || (isStairs == "up" &&
            (Design.Edges["top"].Contains(section) ||
            Design.Edges["bottom"].Contains(section) ||
            Design.Edges["right"].Contains(section) ||
            Design.Edges["left"].Contains(section))))
        {
            if (Design.Edges["top"].Contains(section))
            {
                validConnections.UnionWith(MapConstants.BOTTOM_CONNECTIONS);
            }
            if (Design.Edges["bottom"].Contains(section))
            {
                validConnections.UnionWith(MapConstants.TOP_CONNECTIONS);
            }
            if (Design.Edges["left"].Contains(section))
            {
                validConnections.UnionWith(MapConstants.RIGHT_CONNECTIONS);
            }
            if (Design.Edges["right"].Contains(section))
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

        Design.ConnectionMatrix[section.row][section.col] = GetFinalConnectionState(validConnections,
                                                                             requiredConnections,
                                                                             isEntrance,
                                                                             isStairs);
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

            SortedSet<string> incomingConnections = Design.ConnectionMatrix[neighbor.row][neighbor.col];

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
                // If tile is down and right remove B7 and R7, prevents large room tiles
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
                // If a large tile with a T & L connection add the required B & R connections
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
    /// <param name="validConnections">The valid connections determined available to the section.
    /// </param>
    /// <param name="requiredConnections">The required connections determined for the section.
    /// </param>
    /// <param name="isEntrance">Determines if the method should treat the location as an entrance.
    /// </param>
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
            if ((requiredConnections.Count != 0 &&
                    !requiredConnections.IsSubsetOf(tile.Connections)) ||
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
                if (!validConnections.Contains(connection) &&
                    !requiredConnections.Contains(connection))
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
    /// <param name="protectRoute">If true all nodes on route to the target will be added to the 
    /// SafetyBuffer</param>
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
                        Design.SafetyBuffer.Add(section);
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
        SortedSet<string> stateConnections = Design.ConnectionMatrix[row][col];
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
            SortedSet<string> neighborConnections = Design.ConnectionMatrix[nRow][nCol];

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
    /// Adds the surrounding sections of the provided section to the safety buffer, helps prevent
    /// invalid map designs during entrance placement, seeding and random tile selection. Adjacent
    /// tiles are also added to the buffer. Areas outside of map bounds are excluded.
    /// </summary>
    /// <param name="section">The section to protect</param>
    private void ProtectWithSafetyBuffer((int row, int col) section)
    {
        (int row, int col) = section;
        List<(int row, int col)> neighborsToAdd = [
            (row - 1, col - 1),// Starting clockwise from top left neighbor
            (row - 1, col),
            (row - 1, col + 1),
            (row, col + 1),
            (row + 1, col + 1),
            (row + 1, col),
            (row + 1, col - 1),
            (row, col - 1)
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
            Design.SafetyBuffer.Add(neighbor);
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
        while (Design.SafetyBuffer.Contains(seed)
            || Design.SeededSections.Contains(seed)
            || Design.Entrance == seed
            || Design.StairsUp == seed
            || Design.StairsDown == seed)
        {
            seed = (_Random.Next(Height), _Random.Next(Width));
            failures++;
            if (failures > 9)
            {
                return;// Could not find a safe section to seed randomly
            }
        }

        Design.SeededSections.Add(seed);
        ProtectWithSafetyBuffer(seed);
        GetNeighboringConnections(seed, validConnections, requiredConnections);
        Design.ConnectionMatrix[seed.row][seed.col] = GetFinalConnectionState(validConnections,
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
                if (Design.ConnectionMatrix[row][col].First() == "N")
                {
                    SortedSet<string> validConnections = [];
                    SortedSet<string> requiredConnections = [];
                    (int row, int col) section = (row, col);
                    GetNeighboringConnections(section, validConnections, requiredConnections);
                    validConnections = RandomDesignQuery(validConnections, requiredConnections);
                    Design.ConnectionMatrix[row][col] = validConnections;
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
    private SortedSet<string> RandomDesignQuery(SortedSet<string> validConnections,
                                                SortedSet<string> requiredConnections)
    {
        // If there are no connections for this tile set it as empty 'E'
        if (validConnections.Count == 0 && requiredConnections.Count == 0)
        {
            DungeonTileModel emptyTile = DBTiles.Where(x => x.Connections.First() == "E").First();
            return emptyTile.Connections;
        }

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
        else
        {
            // No valid tile found = invalid design
            throw new MapDesignException("Error: Could not produce a tile with valid connections " +
            $"= {validConnections} and required = {requiredConnections}. Printing map design...\n" +
            $"{Design}");
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
                if ((row, col) == mapStart || Design.ConnectionMatrix[row][col].First() == "E")
                {
                    continue;
                }

                // If AStar failure = invalid design
                if (!AStar(mapStart, (row, col)))
                {
                    throw new MapDesignException($"Error: Tile (row : {row}, col : {col}) " +
                $"could not be reached from Map Start (row : {mapStart.row}, col : {mapStart.col})." +
                $" Printing map design...\n{Design}");
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
                SortedSet<string> requiredConnections = Design.ConnectionMatrix[row][col];
                List<DungeonTileModel> validTiles = [];

                // Filter tiles by connections and settings
                if ((row, col) == Design.Entrance)
                {
                    validTiles = DBTiles.Where(t => t.IsEntrance == true && t.Connections
                                        .SequenceEqual(requiredConnections))
                                        .ToList();
                }
                else if ((row, col) == Design.StairsUp)
                {
                    validTiles = DBTiles.Where(t => t.IsStairs == "up" && t.Connections
                                        .SequenceEqual(requiredConnections))
                                        .ToList();
                }
                else if ((row, col) == Design.StairsDown)
                {
                    validTiles = DBTiles.Where(t => t.IsStairs == "down" && t.Connections
                                        .SequenceEqual(requiredConnections))
                                        .ToList();
                }
                else
                {
                    validTiles = DBTiles.Where(t => t.IsEntrance == false && t.IsStairs == "false"
                                        && t.Connections.SequenceEqual(requiredConnections))
                                        .ToList();
                }

                // Add all valid ids and images to TileMatrix and ImageMap
                List<int> validIds = [];
                foreach (var tile in validTiles)
                {
                    Design.TileMatrix[row][col].Add(tile.Id);
                    Design.ImageMap.TryAdd(tile.Id, tile.Filename);
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
                int randomId = Design.TileMatrix[row][col].ElementAt(_Random.Next(Design.TileMatrix[row][col].Count));
                Design.DisplayMatrix[row][col] = randomId;
            }
        }
    }
}
