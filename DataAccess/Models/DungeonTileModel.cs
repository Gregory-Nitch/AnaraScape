/**
 * Represents a section of a dungeon map. 8x8 grid
 */

namespace DataAccess.Models;

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
