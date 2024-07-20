namespace DataAccess.Models.DungeonModels;

/// <summary>
/// Represents a 8x8 tile loaded from the database, converted to its proper form.
/// </summary>
/// <param name="storedTile">Tile loaded from the database</param>
public class DungeonTileModel(StoredDungeonTileModel storedTile)
{
    public int Id { get; set; } = storedTile.Id;
    public string TileName { get; set; } = storedTile.TileName;
    public string Style { get; set; } = storedTile.Style;
    public SortedSet<string> Connections { get; set; } = [.. storedTile.Connections.Split(',')];
    public bool IsEntrance { get; set; } = storedTile.IsEntrance;
    public string IsStairs { get; set; } = storedTile.IsStairs;
    public string Filename { get; set; } = storedTile.Filename;
}


/// <summary>
/// Represents a tile to load to the database, id then is provided by db
/// </summary>
/// <param name="tileName">name of tile</param>
/// <param name="style">tiles style</param>
/// <param name="connections">connections as a string</param>
/// <param name="isEntrance">entrance flag</param>
/// <param name="isStairs">stairs state</param>
/// <param name="filename">actual filename of image</param>
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
