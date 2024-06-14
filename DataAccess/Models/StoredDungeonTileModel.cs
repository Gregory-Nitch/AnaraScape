/**
 * Represents a tile to loaded from the database, (connections are string)
 */


namespace DataAccess.Models;

public class StoredDungeonTileModel(int id,
                              string tileName,
                              string style,
                              string connections,
                              bool isEntrance,
                              string isStairs,
                              string filename)
{
    public int Id { get; set; } = id;
    public string TileName { get; set; } = tileName;
    public string Style { get; set; } = style;
    public string Connections { get; set; } = connections;
    public bool IsEntrance { get; set; } = isEntrance;
    public string IsStairs { get; set; } = isStairs;
    public string Filename { get; set; } = filename;
}