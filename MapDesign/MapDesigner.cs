

using DataAccess.Models;
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

    // All tiles in DB that matched passed style, ie 'fort' etc...
    private readonly List<DungeonTileModel> DBTiles = DBTiles;

    // Represents each section of the map and its current connections *3D*
    private List<List<List<string>>> ConnectionMatrix { get; } = [];
    // Represents sections in the map that should be protected from random seeding
    private HashSet<(int row, int col)> SafetyBuffer = [];
    // Represent sections choosen to have a random tile placed in it
    private HashSet<(int row, int col)> SeededSections = [];
    private int RequiredSeeds = 0;

    // Represents Entry point & stairs into the dungeon
    private (int? row, int? col) Entrance = (null, null);
    private (int? row, int? col) StairsUp = (null, null);
    private (int? row, int? col) StairsDown = (null, null);

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
    // Holds the associated filename for the output matrices
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
}
