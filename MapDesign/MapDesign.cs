using System.Text;

namespace MapDesignLibrary;

/// <summary>
/// Represents a valid dungeon design, main output objects are the TileMatrix, DisplayMatrix and 
/// ImageMap fields.
/// </summary>
public class MapDesign
{
    // Represents each section of the map and its current connections *3D*
    internal List<List<SortedSet<string>>> ConnectionMatrix { get; } = [];
    // Represents sections in the map that should be protected from random seeding
    internal SortedSet<(int row, int col)> SafetyBuffer = [];
    // Represent sections chosen to have a random tile placed in it
    internal SortedSet<(int row, int col)> SeededSections = [];
    internal int RequiredSeeds = 0;

    // Represents Entry point & stairs into the dungeon, -1 indicates not used/assigned
    internal (int row, int col) Entrance = (-1, -1);
    internal (int row, int col) StairsUp = (-1, -1);
    internal (int row, int col) StairsDown = (-1, -1);

    /* ! Edges and corners require special handling ! */
    internal Dictionary<string, List<(int row, int col)>> Edges = [];

    /* ! Main Outputs ! */
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
}
