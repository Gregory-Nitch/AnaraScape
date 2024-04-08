
using DataAccess.Models;

/**
 * Performs CRUD operations for the map generator features
 */
namespace DataAccess.Crud;

public class MapGeneratorCrud(string connString)
{
    private readonly string _connString = connString;

    private readonly IDBAccess _db;

    public void InsertTile(DungeonTileModel tile)
    {
        _db.WriteToDB("MapGenerator.spDungeonTiles_InsertTile", tile, _connString, true);
    }
}
