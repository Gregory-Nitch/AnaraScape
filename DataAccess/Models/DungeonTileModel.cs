/**
 * Represents a section of a dungeon map. 8x8 grid
 */

namespace DataAccess.Models;

public class DungeonTileModel(string tileName,
                              string style,
                              List<string> connections,
                              bool isEntrance,
                              string isStairs,
                              string filename)
{
    public int Id { get; set; }
    public string TileName { get; set; } = tileName;
    public string Style { get; set; } = style;
    public List<string> Connections { get; set; } = connections;
    public bool IsEntrance { get; set; } = isEntrance;
    public string IsStairs { get; set; } = isStairs;
    public string Filename { get; set; } = filename;
}
