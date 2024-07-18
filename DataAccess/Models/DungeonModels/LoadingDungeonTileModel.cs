namespace DataAccess.Models.DungeonModels;

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
