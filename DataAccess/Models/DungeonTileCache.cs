namespace DataAccess.Models;

/// <summary>
/// This class allows tile information to be loaded from the database and used across the
/// lifetime of the application via the 'DBTile' attribute.
/// </summary>
public class DungeonTileCache
{
    public List<DungeonTileModel> DBTiles { get; } = [];

    /// <summary>
    /// Uses the injected ICrud object to load tiles from the database and assign
    /// them to the DBTiles List.
    /// </summary>
    /// <param name="crud">Crud object to talk to the database</param>
    public DungeonTileCache(ICrud crud)
    {
        List<StoredDungeonTileModel> storedTiles = [.. crud.GetAllTiles()];
        DBTiles = TilesFromStoredTiles(storedTiles);
    }

    /// <summary>
    /// Used to transform all tiles loaded from the database into their base form.
    /// </summary>
    /// <param name="storedTiles">Tile from the database to convert</param>
    /// <returns>List of DungeonTiles converted from the database form</returns>
    public static List<DungeonTileModel> TilesFromStoredTiles(List<StoredDungeonTileModel> storedTiles)
    {
        List<DungeonTileModel> outList = [];
        foreach (var storedTile in storedTiles)
        {
            DungeonTileModel tile = new(storedTile);
            outList.Add(tile);
        }
        return outList;
    }
}
