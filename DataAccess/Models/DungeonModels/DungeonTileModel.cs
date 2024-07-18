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
