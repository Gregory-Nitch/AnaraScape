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

    public List<StoredArtifactModel> GetAllArtifacts() 
    {
        return _db.QueryDB<StoredArtifactModel, dynamic>($"Lore.spArtifacts_SelectAll",
                                                           new { },
                                                           ConnStringName,
                                                           true);
    }

    public List<StoredEventModel> GetAllEvents()
    {
        return _db.QueryDB<StoredEventModel, dynamic>($"Lore.spEvents_SelectAll",
                                                        new { },
                                                        ConnStringName,
                                                        true);
    }

    public List<StoredFactionModel> GetAllFactions()
    {
        return _db.QueryDB<StoredFactionModel, dynamic>($"Lore.spFactions_SelectAll",
                                                          new { },
                                                          ConnStringName,
                                                          true);
    }

    public List<GeoMapModel> GetAllGeoMaps()
    {
        return _db.QueryDB<GeoMapModel, dynamic>($"Lore.spGeoMaps_SelectAll",
                                                   new { },
                                                   ConnStringName,
                                                   true);
    }

    public List<HistoricalAgeModel> GetAllHistoricalAges()
    {
        return _db.QueryDB<HistoricalAgeModel, dynamic>($"Lore.spHistoricalAges_SelectAll",
                                                          new { },
                                                          ConnStringName,
                                                          true);
    }

    public List<LocationModel> GetAllLocations()
    {
        return _db.QueryDB<LocationModel, dynamic>($"Lore.spLocations_SelectAll",
                                                     new { },
                                                     ConnStringName,
                                                     true);
    }

    public List<StoredNPCModel> GetAllNPCs()
    {
        return _db.QueryDB<StoredNPCModel, dynamic>($"Lore.spNPCs_SelectAll",
                                                      new { },
                                                      ConnStringName,
                                                      true);
    }

    public List<ResourceModel> GetAllResources()
    {
        return _db.QueryDB<ResourceModel, dynamic>($"Lore.spResources_SelectAll",
                                                     new { },
                                                     ConnStringName,
                                                     true);
    }

    public List<StoredTerminologyModel> GetAllTerms()
    {
        return _db.QueryDB<StoredTerminologyModel, dynamic>($"Lore.spTerminologies_SelectAll",
                                                              new { },
                                                              ConnStringName,
                                                              true);
    }

    public List<EventArtifactRelationModel> GetAllEventArtifactRelations()
    {
        return _db.QueryDB<EventArtifactRelationModel, dynamic>(
                                              $"Lore.spBT_EventArtifactRelations_SelectAll",
                                              new { },
                                              ConnStringName,
                                              true);
    }

    public List<EventFactionRelationModel> GetAllEventFactionRelations()
    {
        return _db.QueryDB<EventFactionRelationModel, dynamic>(
                                              $"Lore.spBT_EventFactionRelations_SelectAll",
                                              new { },
                                              ConnStringName,
                                              true);
    }

    public List<LocationEventRelationModel> GetAllLocationEventRelations()
    {
        return _db.QueryDB<LocationEventRelationModel, dynamic>(
                                              $"Lore.spBT_LocationEventRelations_SelectAll",
                                              new { },
                                              ConnStringName,
                                              true);
    }

    public List<LocationFactionRelationModel> GetAllLocationFactionRelations()
    {
        return _db.QueryDB<LocationFactionRelationModel, dynamic>(
                                              $"Lore.spBT_LocationFactionRelations_SelectAll",
                                              new { },
                                              ConnStringName,
                                              true);
    }

    public List<LocationResourceRelationModel> GetAllLocationResourceRelations()
    {
        return _db.QueryDB<LocationResourceRelationModel, dynamic>(
                                              $"Lore.spBT_LocationResourceRelations_SelectAll",
                                              new { },
                                              ConnStringName,
                                              true);
    }

    public List<NPCEventRelationModel> GetAllNPCEventRelations()
    {
        return _db.QueryDB<NPCEventRelationModel, dynamic>(
                                              $"Lore.spBT_NPCEventRelations_SelectAll",
                                              new { },
                                              ConnStringName,
                                              true);
    }

    public List<NPCFactionRelationModel> GetAllNPCFactionRelations()
    {
        return _db.QueryDB<NPCFactionRelationModel, dynamic>(
                                              $"Lore.spBT_NPCFactionRelations_SelectAll",
                                              new { },
                                              ConnStringName,
                                              true);
    }
}
