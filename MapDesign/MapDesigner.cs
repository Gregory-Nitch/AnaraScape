

using DataAccess.Models;
using MapDesign;
using System.Text;

/**
 * This class does all the random generation for map creation, but is not persisted in any data store
 */
namespace DataAccess;

public class MapDesigner(int height, int width, string style, string level, bool needsStairs, List<DungeonTileModel> DBTiles)
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
    private List<List<List<string>>> ConnectionMatrix { get; } = [];
    // Represents sections in the map that should be protected from random seeding
    private HashSet<(int row, int col)> SafetyBuffer = [];
    // Represent sections chosen to have a random tile placed in it
    private HashSet<(int row, int col)> SeededSections = [];
    private int RequiredSeeds = 0;

    // Represents Entry point & stairs into the dungeon, -1 indicates not used/assigned
    private (int row, int col) Entrance = (-1, -1);
    private (int row, int col) StairsUp = (-1, -1);
    private (int row, int col) StairsDown = (-1, -1);

    /* Edges and corners require special handling */
    private Dictionary<string, List<(int row, int col)>> Edges = [];
    private (int row, int col) TopLeftCorner { get; } = (0, 0);
    private (int row, int col) BottomLeftCorner { get; } = (height - 1, 0);
    private (int row, int col) TopRightCorner { get; } = (0, width - 1);
    private (int row, int col) BottomRightCorner { get; } = (height - 1, width - 1);

    /* Outputs */
    // Represents each tile id that can fill the connection matrix above *3D*
    public List<List<List<int>>> TileMatrix { get; } = [];
    // Represents the tiles chosen for display *2D*
    public List<List<int>> DisplayMatrix { get; } = [];
    // Holds the associated filename for the output matrixes
    public Dictionary<int, string> ImageMap { get; } = [];

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

    public void Generate()
    {
        PrepareMatrixes();

        DefineEdges();

        DefineEntryPoints();



        // Start of Seeding TODO <- remove
        if (Height + Width > 5)
        {
            RequiredSeeds = Height + Width - 5;
        }
    }

    private void PrepareMatrixes()
    {
        for (int i = 0; i < Height; i++)
        {
            List<List<string>> row = [];
            for (int j = 0; j < Width; j++)
            {
                List<string> col = ["N"];
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

    private void SetStackConnections((int row, int col) section,
                                     bool isEntrance = false,
                                     string isStairs = "false")
    {
        List<string> validConnections = [];
        List<string> requiredConnections = [];

        if (isEntrance || (isStairs == "up" &&
            (Edges["top"].Contains(section) ||
            Edges["bottom"].Contains(section) ||
            Edges["right"].Contains(section) ||
            Edges["left"].Contains(section))))
        {
            if (Edges["top"].Contains(section))
            {
                validConnections.AddRange(MapConstants.BOTTOM_CONNECTIONS);
            }
            if (Edges["bottom"].Contains(section))
            {
                validConnections.AddRange(MapConstants.TOP_CONNECTIONS);
            }
            if (Edges["left"].Contains(section))
            {
                validConnections.AddRange(MapConstants.RIGHT_CONNECTIONS);
            }
            if (Edges["right"].Contains(section))
            {
                validConnections.AddRange(MapConstants.LEFT_CONNECTIONS);
            }
        }

        else if (isStairs == "up")
        {
            validConnections.AddRange(MapConstants.BOTTOM_CONNECTIONS);
            validConnections.AddRange(MapConstants.TOP_CONNECTIONS);
            validConnections.AddRange(MapConstants.RIGHT_CONNECTIONS);
            validConnections.AddRange(MapConstants.LEFT_CONNECTIONS);
        }

        else
        {
            GetNeighboringConnections(section, validConnections, requiredConnections);
        }
        validConnections.Sort();
        requiredConnections.Sort();

        GetFinalConnectionState(validConnections, requiredConnections, isEntrance, isStairs);

        ConnectionMatrix[section.row][section.col].AddRange(validConnections);
    }

    private void AddToSafetyBuffer((int row, int col) section)
    {
        throw new NotImplementedException();
    }

    private void GetNeighboringConnections((int row, int col) section,
                                           List<string> validConnections,
                                           List<string> requiredConnections)
    {
        throw new NotImplementedException();
    }

    private void GetFinalConnectionState(List<string> validConnections,
                                         List<string> requiredConnections,
                                         bool isEntrance,
                                         string isStairs)
    {
        throw new NotImplementedException();
    }
}
