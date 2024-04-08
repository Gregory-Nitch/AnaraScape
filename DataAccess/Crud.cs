using DataAccess.Models;

/**
 * Performs CRUD operations for the map generator features
 */
namespace DataAccess;

public class Crud : ICrud
{
    private readonly string ConnStringName = "Dev";

    private readonly IDBAccess _db;

    public Crud(IDBAccess db) { _db = db; }

    public void InsertTile(DungeonTileModel tile)
    {
        string Connections = string.Join(",", tile.Connections);

        _db.WriteToDB("MapGenerator.spDungeonTiles_InsertTile",
            new
            {
                tile.TileName,
                tile.Style,
                Connections,
                tile.IsEntrance,
                tile.IsStairs,
                tile.Filename,
            }, ConnStringName, true);
    }
}
