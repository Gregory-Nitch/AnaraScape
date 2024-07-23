using DataAccess.Models.DungeonModels;
using DataAccess.Models.LoggingModels;
using DataAccess.Models.LoreModels;

namespace DataAccess;

/// <summary>
/// Performs CRUD operations for AnaraScape
/// </summary>
/// <param name="db"></param>
public class Crud(IDBAccess db) : ICrud
{
    private readonly string ConnStringName = "Dev";

    private readonly IDBAccess _db = db;

    public void InsertTile(LoadingDungeonTileModel tile)
    {
        _db.WriteToDB("MapGenerator.spDungeonTiles_InsertTile",
                       new
                       {
                           tile.TileName,
                           tile.Style,
                           tile.Connections,
                           tile.IsEntrance,
                           tile.IsStairs,
                           tile.Filename,
                       },
                       ConnStringName,
                       true);
    }

    /// <summary>
    /// DELETEs ALL tiles from the database. 
    /// </summary>
    public void DeleteAllTiles()
    {
        _db.WriteToDB("MapGenerator.spDungeonTiles_DeleteAllTiles",
                      new { },
                      ConnStringName,
                      true);
    }

    public List<StoredDungeonTileModel> GetAllTiles()
    {
        return _db.QueryDB<StoredDungeonTileModel, dynamic>("MapGenerator.spDungeonTiles_GetAllTiles",
                                               new { },
                                               ConnStringName,
                                               true);
    }

    public void InsertLogEvent(LogEvent evt)
    {
        _db.WriteToDB("Logging.spLogEvents_InsertEvent", evt, ConnStringName, true);
    }

    public List<LogEvent> GetAllLogEvents()
    {
        return _db.QueryDB<LogEvent, dynamic>("Logging.spLogEvents_GetAll",
                                              new { },
                                              ConnStringName,
                                              true);
    }

    public List<LogEvent> GetLogsAfter(DateTime date)
    {
        return _db.QueryDB<LogEvent, dynamic>("Logging.spLogEvents_GetAfter",
                                              new { date },
                                              ConnStringName,
                                              true);
    }

    public List<LogEvent> GetLogsBefore(DateTime date)
    {
        return _db.QueryDB<LogEvent, dynamic>("Logging.spLogEvents_GetBefore",
                                              new { date },
                                              ConnStringName,
                                              true);
    }

    public List<LogEvent> GetLogsInRange(DateTime beginDate, DateTime endDate)
    {
        return _db.QueryDB<LogEvent, dynamic>("Logging.spLogEvents_GetRange",
                                              new { beginDate, endDate },
                                              ConnStringName,
                                              true);
    }

    public void InsertLore<T>(T loreObj, LoreTable table)
    {
        _db.WriteToDB(LoreFactory.StoredProcessLoreMap[table], loreObj, ConnStringName, true);
    }
}
