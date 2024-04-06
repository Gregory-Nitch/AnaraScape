/**
 * Represents a section of a dungeon map. 8x8 grid
 */

namespace DataAccess.Models;

public class DungeonTileModel(int Id,
                              string TileName,
                              string Style,
                              List<string> Connections,
                              bool IsEntrance,
                              string IsStairs,
                              string FileName)
{
    public int Id { get; set; } = Id;
    public string TileName { get; set; } = TileName;
    public string Style { get; set; } = Style;
    public List<string> Connections { get; set; } = Connections;
    public bool IsEntrance { get; set; } = IsEntrance;
    public string IsStairs { get; set; } = IsStairs;
    public string FileName { get; set; } = FileName;
}
