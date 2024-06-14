/**
 * Represents a tile to load to the database, (no id on construction)
 */


namespace DataAccess.Models;

public class LoadingDungeonTileModel(string tileName,
                              string style,
                              string connections,
                              bool isEntrance,
                              string isStairs,
                              string filename)
{
    public string TileName { get; set; } = tileName;
    public string Style { get; set; } = style;
    public string Connections { get; set; } = connections;
    public bool IsEntrance { get; set; } = isEntrance;
    public string IsStairs { get; set; } = isStairs;
    public string Filename { get; set; } = filename;
}
