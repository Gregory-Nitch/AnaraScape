using DataAccess.Models;

/**
 * Performs CRUD operations for the map generator features
 */
namespace DataAccess;

public class Crud(IDBAccess db) : ICrud
{
    private readonly string ConnStringName = "Dev";

    private readonly IDBAccess _db = db;

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
                       },
                       ConnStringName,
                       true);
    }

    /** DELETES ALL tiles from the database */
    public void DeleteAllTiles()
    {
        _db.WriteToDB("MapGenerator.spDungeonTiles_DeleteAllTiles",
                      new { },
                      ConnStringName,
                      true);
    }

    public List<DungeonTileModel> GetAllTiles()
    {
        return _db.QueryDB<DungeonTileModel, dynamic>("MapGenerator.spDungeonTiles_GetAllTiles",
                                               new { },
                                               ConnStringName,
                                               true);
    }
}
