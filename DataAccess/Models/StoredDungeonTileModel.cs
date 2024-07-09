/**
 * Represents a tile to loaded from the database, (connections are string)
 */


namespace DataAccess.Models;

/// <summary>
/// Represents a tile to be loaded from the database, connections are a string and id originates
/// from the database.
/// </summary>
/// <param name="id">id (supplied from db)</param>
/// <param name="tileName">name of tile</param>
/// <param name="style">style of tile</param>
/// <param name="connections">all connections as a string</param>
/// <param name="isEntrance">entrance flag</param>
/// <param name="isStairs">stairs flag</param>
/// <param name="filename">actual filename for the tile image</param>
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
