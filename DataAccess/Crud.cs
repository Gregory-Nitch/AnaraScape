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
        _db.WriteToDB(LoreFactory.StoredProcedureInsertLoreMap[table],
                      loreObj,
                      ConnStringName,
                      true);
    }

    public List<StoredArtifactModel> GetAllArtifacts()
    {
        return _db.QueryDB<StoredArtifactModel, dynamic>("Lore.spArtifacts_SelectAll",
                                                           new { },
                                                           ConnStringName,
                                                           true);
    }

    public List<StoredEventModel> GetAllEvents()
    {
        return _db.QueryDB<StoredEventModel, dynamic>("Lore.spEvents_SelectAll",
                                                        new { },
                                                        ConnStringName,
                                                        true);
    }

    public List<StoredFactionModel> GetAllFactions()
    {
        return _db.QueryDB<StoredFactionModel, dynamic>("Lore.spFactions_SelectAll",
                                                          new { },
                                                          ConnStringName,
                                                          true);
    }

    public List<GeoMapModel> GetAllGeoMaps()
    {
        return _db.QueryDB<GeoMapModel, dynamic>("Lore.spGeoMaps_SelectAll",
                                                   new { },
                                                   ConnStringName,
                                                   true);
    }

    public List<HistoricalAgeModel> GetAllHistoricalAges()
    {
        return _db.QueryDB<HistoricalAgeModel, dynamic>("Lore.spHistoricalAges_SelectAll",
                                                          new { },
                                                          ConnStringName,
                                                          true);
    }

    public List<LocationModel> GetAllLocations()
    {
        return _db.QueryDB<LocationModel, dynamic>("Lore.spLocations_SelectAll",
                                                     new { },
                                                     ConnStringName,
                                                     true);
    }

    public List<StoredNPCModel> GetAllNPCs()
    {
        return _db.QueryDB<StoredNPCModel, dynamic>("Lore.spNPCs_SelectAll",
                                                      new { },
                                                      ConnStringName,
                                                      true);
    }

    public List<ResourceModel> GetAllResources()
    {
        return _db.QueryDB<ResourceModel, dynamic>("Lore.spResources_SelectAll",
                                                     new { },
                                                     ConnStringName,
                                                     true);
    }

    public List<StoredTerminologyModel> GetAllTerms()
    {
        return _db.QueryDB<StoredTerminologyModel, dynamic>("Lore.spTerminologies_SelectAll",
                                                              new { },
                                                              ConnStringName,
                                                              true);
    }

    public List<EventArtifactRelationModel> GetAllEventArtifactRelations()
    {
        return _db.QueryDB<EventArtifactRelationModel, dynamic>(
                                              "Lore.spBT_EventArtifactRelations_SelectAll",
                                              new { },
                                              ConnStringName,
                                              true);
    }

    public List<EventFactionRelationModel> GetAllEventFactionRelations()
    {
        return _db.QueryDB<EventFactionRelationModel, dynamic>(
                                              "Lore.spBT_EventFactionRelations_SelectAll",
                                              new { },
                                              ConnStringName,
                                              true);
    }

    public List<LocationEventRelationModel> GetAllLocationEventRelations()
    {
        return _db.QueryDB<LocationEventRelationModel, dynamic>(
                                              "Lore.spBT_LocationEventRelations_SelectAll",
                                              new { },
                                              ConnStringName,
                                              true);
    }

    public List<LocationFactionRelationModel> GetAllLocationFactionRelations()
    {
        return _db.QueryDB<LocationFactionRelationModel, dynamic>(
                                              "Lore.spBT_LocationFactionRelations_SelectAll",
                                              new { },
                                              ConnStringName,
                                              true);
    }

    public List<LocationResourceRelationModel> GetAllLocationResourceRelations()
    {
        return _db.QueryDB<LocationResourceRelationModel, dynamic>(
                                              "Lore.spBT_LocationResourceRelations_SelectAll",
                                              new { },
                                              ConnStringName,
                                              true);
    }

    public List<NPCEventRelationModel> GetAllNPCEventRelations()
    {
        return _db.QueryDB<NPCEventRelationModel, dynamic>(
                                              "Lore.spBT_NPCEventRelations_SelectAll",
                                              new { },
                                              ConnStringName,
                                              true);
    }

    public List<NPCFactionRelationModel> GetAllNPCFactionRelations()
    {
        return _db.QueryDB<NPCFactionRelationModel, dynamic>(
                                              "Lore.spBT_NPCFactionRelations_SelectAll",
                                              new { },
                                              ConnStringName,
                                              true);
    }

    public StoredArtifactModel? GetStoredArtifactById(int id)
    {
        return _db.QueryDB<StoredArtifactModel, dynamic>("Lore.spArtifacts_GetById",
                                                         new { id },
                                                         ConnStringName,
                                                         true).FirstOrDefault();
    }

    public StoredEventModel? GetStoredEventById(int id)
    {
        return _db.QueryDB<StoredEventModel, dynamic>("Lore.spEvents_GetById",
                                                       new { id },
                                                       ConnStringName,
                                                       true).FirstOrDefault();
    }

    public StoredFactionModel? GetStoredFactionById(int id)
    {
        return _db.QueryDB<StoredFactionModel, dynamic>("Lore.spFactions_GetById",
                                                         new { id },
                                                         ConnStringName,
                                                         true).FirstOrDefault();
    }

    public GeoMapModel? GetGeoMapById(int id)
    {
        return _db.QueryDB<GeoMapModel, dynamic>("Lore.spGeoMaps_GetById",
                                                  new { id },
                                                  ConnStringName,
                                                  true).FirstOrDefault();
    }

    public HistoricalAgeModel? GetHistoricalAgeById(int id)
    {
        return _db.QueryDB<HistoricalAgeModel, dynamic>("Lore.spHistoricalAges_GetById",
                                                         new { id },
                                                         ConnStringName,
                                                         true).FirstOrDefault();
    }

    public LocationModel? GetLocationById(int id)
    {
        return _db.QueryDB<LocationModel, dynamic>("Lore.spLocations_GetById",
                                                    new { id },
                                                    ConnStringName,
                                                    true).FirstOrDefault();
    }

    public StoredNPCModel? GetStoredNPCById(int id)
    {
        return _db.QueryDB<StoredNPCModel, dynamic>("Lore.spNPCs_GetById",
                                                     new { id },
                                                     ConnStringName,
                                                     true).FirstOrDefault();
    }

    public ResourceModel? GetResourceById(int id)
    {
        return _db.QueryDB<ResourceModel, dynamic>("Lore.spResources_GetById",
                                                    new { id },
                                                    ConnStringName,
                                                    true).FirstOrDefault();
    }

    public StoredTerminologyModel? GetStoredTerminologyById(int id)
    {
        return _db.QueryDB<StoredTerminologyModel, dynamic>("Lore.spTerminologies_GetById",
                                                             new { id },
                                                             ConnStringName,
                                                             true).FirstOrDefault();
    }

    public EventArtifactRelationModel? GetEventArtifactRelationByCompositeId(int eventId,
                                                                             int artifactId)
    {
        return _db.QueryDB<EventArtifactRelationModel, dynamic>(
                            "Lore.spBT_EventArtifactRelations_GetByCK",
                            new { eventId, artifactId },
                            ConnStringName,
                            true).FirstOrDefault();
    }

    public EventFactionRelationModel? GetEventFactionRelationByCompositeId(int eventId,
                                                                           int factionId)
    {
        return _db.QueryDB<EventFactionRelationModel, dynamic>(
                            "Lore.spBT_EventFactionRelations_GetByCK",
                            new { eventId, factionId },
                            ConnStringName,
                            true).FirstOrDefault();
    }

    public LocationEventRelationModel? GetLocationEventRelationByCompositeId(int locationId,
                                                                             int eventId)
    {
        return _db.QueryDB<LocationEventRelationModel, dynamic>(
                            "Lore.spBT_LocationEventRelations_GetByCK",
                            new { eventId, locationId },
                            ConnStringName,
                            true).FirstOrDefault();
    }

    public LocationFactionRelationModel? GetLocationFactionRelationByCompositeId(int locationId,
                                                                                 int factionId)
    {
        return _db.QueryDB<LocationFactionRelationModel, dynamic>(
                            "Lore.spBT_LocationFactionRelations_GetByCK",
                            new { locationId, factionId },
                            ConnStringName,
                            true).FirstOrDefault();
    }

    public LocationResourceRelationModel? GetLocationResourceRelationByCompositeId(int locationId,
                                                                                  int resourceId)
    {
        return _db.QueryDB<LocationResourceRelationModel, dynamic>(
                                                     "Lore.spBT_LocationResourceRelations_GetByCK",
                                                     new { locationId, resourceId },
                                                     ConnStringName,
                                                     true).FirstOrDefault();
    }

    public NPCEventRelationModel? GetNPCEventRelationByCompositeId(int npcId, int eventId)
    {
        return _db.QueryDB<NPCEventRelationModel, dynamic>("Lore.spBT_NPCEventRelations_GetByCK",
                                                           new { npcId, eventId },
                                                           ConnStringName,
                                                           true).FirstOrDefault();
    }

    public NPCFactionRelationModel? GetNPCFactionRelationByCompositeId(int npcId, int factionId)
    {
        return _db.QueryDB<NPCFactionRelationModel, dynamic>(
                                                   "Lore.spBT_NPCFactionRelations_GetByCK",
                                                   new { npcId, factionId },
                                                   ConnStringName,
                                                   true).FirstOrDefault();
    }

    public void UpdateLore<T>(T loreObj, LoreTable table)
    {
        _db.WriteToDB(LoreFactory.StoredProcedureUpdateLoreMap[table],
                      loreObj,
                      ConnStringName,
                      true);
    }

    public void UpdateEventArtifactRelationByCompositeId(int eventId,
                                                         int artifactId,
                                                         int oldEventId,
                                                         int oldArtifactId)
    {
        _db.WriteToDB("Lore.spBT_EventArtifactRelations_UpdateByCK",
                      new { eventId, artifactId, oldEventId, oldArtifactId },
                      ConnStringName,
                      true);
    }

    public void UpdateEventFactionRelationByCompositeId(int eventId,
                                                        int factionId,
                                                        int oldEventId,
                                                        int oldFactionId)
    {
        _db.WriteToDB("Lore.spBT_EventFactionRelations_UpdateByCK",
                       new { eventId, factionId, oldEventId, oldFactionId },
                       ConnStringName,
                       true);
    }

    public void UpdateLocationEventRelationByCompositeId(int locationId,
                                                         int eventId,
                                                         int oldLocationId,
                                                         int oldEventId)
    {
        _db.WriteToDB("Lore.spBT_LocationEventRelations_UpdateByCK",
                       new { locationId, eventId, oldLocationId, oldEventId },
                       ConnStringName,
                       true);
    }

    public void UpdateLocationResourceRelationByCompositeId(int locationId,
                                                            int resourceId,
                                                            int oldLocationId,
                                                            int oldResourceId)
    {
        _db.WriteToDB("Lore.spBT_LocationResourceRelations_UpdateByCK",
                       new { locationId, resourceId, oldLocationId, oldResourceId },
                       ConnStringName,
                       true);
    }

    public void UpdateNPCEventRelationsByCompositeId(int npcId,
                                                     int eventId,
                                                     int oldNPCId,
                                                     int oldEventId)
    {
        _db.WriteToDB("Lore.spBT_NPCEventRelations_UpdateByCK",
                       new { npcId, eventId, oldNPCId, oldEventId },
                       ConnStringName,
                       true);
    }

    public void UpdateNPCFactionRelationByCompositeId(int npcId,
                                                      int factionId,
                                                      int oldNPCId,
                                                      int oldFactionId)
    {
        _db.WriteToDB("Lore.spBT_NPCFactionRelations_UpdateByCK",
                       new { npcId, factionId, oldNPCId, oldFactionId },
                       ConnStringName,
                       true);
    }

    public void UpdateLocationFactionRelationByCompositeId(int locationId,
                                                           int factionId,
                                                           int oldLocationId,
                                                           int oldFactionId)
    {
        _db.WriteToDB("Lore.spBT_LocationFactionRelations_UpdateByCK",
                       new { locationId, factionId, oldLocationId, oldFactionId },
                       ConnStringName,
                       true);
    }

    public void DeleteLoreById(int id, LoreTable table)
    {
        _db.WriteToDB($"Lore.sp{table}_DeleteById", new { id }, ConnStringName, true);
    }

    public void DeleteEventArtifactRelationByCompositeId(int eventId, int artifactId)
    {
        _db.WriteToDB("Lore.spBT_EventArtifactRelations_DeleteByCK",
                      new { eventId, artifactId },
                      ConnStringName,
                      true);
    }

    public void DeleteEventFactionRelationByCompositeId(int eventId, int factionId)
    {
        _db.WriteToDB("Lore.spBT_EventFactionRelations_DeleteByCK",
                       new { eventId, factionId },
                       ConnStringName,
                       true);
    }

    public void DeleteLocationEventRelationByCompositeId(int locationId, int eventId)
    {
        _db.WriteToDB("Lore.spBT_LocationEventRelations_DeleteByCK",
                       new { locationId, eventId },
                       ConnStringName,
                       true);
    }

    public void DeleteLocationFactionRelationByCompositeId(int locationId, int factionId)
    {
        _db.WriteToDB("Lore.spBT_LocationFactionRelations_DeleteByCK",
                       new { locationId, factionId },
                       ConnStringName,
                       true);
    }

    public void DeleteLocationResourceRelationByCompositeId(int locationId, int resourceId)
    {
        _db.WriteToDB("Lore.spBT_LocationResourceRelations_DeleteByCK",
                       new { locationId, resourceId },
                       ConnStringName,
                       true);
    }

    public void DeleteNPCEventRelationsByCompositeId(int npcId, int eventId)
    {
        _db.WriteToDB("Lore.spBT_NPCEventRelations_DeleteByCK",
                       new { npcId, eventId },
                       ConnStringName,
                       true);
    }

    public void DeleteNPCFactionRelationByCompositeId(int npcId, int factionId)
    {
        _db.WriteToDB("Lore.spBT_NPCFactionRelations_DeleteByCK",
                       new { npcId, factionId },
                       ConnStringName,
                       true);
    }

    public List<(int id, string name)> GetArtifactsLike(string likeName)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spArtifacts_GetLike",
                                                   new { Name = likeName },
                                                   ConnStringName,
                                                   true);
    }

    public List<(int id, string name)> GetEventsLike(string likeName)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spEvents_GetLike",
                                                   new { Name = likeName },
                                                   ConnStringName,
                                                   true);

    }

    public List<(int id, string name)> GetFactionsLike(string likeName)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spFactions_GetLike",
                                                   new { Name = likeName },
                                                   ConnStringName,
                                                   true);

    }

    public List<(int id, string name)> GetGeoMapsLike(string likeName)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spGeoMaps_GetLike",
                                                   new { Name = likeName },
                                                   ConnStringName,
                                                   true);

    }

    public List<(int id, string name)> GetLocationsLike(string likeName)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spLocations_GetLike",
                                                   new { Name = likeName },
                                                   ConnStringName,
                                                   true);
    }

    public List<(int id, string name)> GetNPCsLike(string likeName)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spNPCs_GetLike",
                                                   new { Name = likeName },
                                                   ConnStringName,
                                                   true);

    }

    public List<(int id, string name)> GetResourcesLike(string likeName)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spResources_GetLike",
                                                   new { Name = likeName },
                                                   ConnStringName,
                                                   true);

    }

    public List<(int id, string name)> GetTerminologiesLike(string likeName)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spTerminologies_GetLike",
                                                   new { Name = likeName },
                                                   ConnStringName,
                                                   true);

    }

    public FullLocationModel? GetFullLocationInfoById(int id)
    {
        return _db.QueryDB<FullLocationModel, dynamic>("Lore.spLocations_GetFullInfoById",
                                              new { id },
                                              ConnStringName,
                                              true).FirstOrDefault();
    }

    public List<(int id, string name)> GetLocationArtifacts(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spArtifacts_GetLocationArtifacts",
                                                   new { id },
                                                   ConnStringName,
                                                   true);
    }

    public List<(int id, string name)> GetLocationEvents(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spBT_LocationEventRelations_GetLocationEvents",
                                                   new { id },
                                                   ConnStringName,
                                                   true);
    }

    public List<(int id, string name)> GetLocationFactions(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spBT_LocationFactionRelations_GetLocationFactions",
                                                   new { id },
                                                   ConnStringName,
                                                   true);
    }

    public List<(int id, string name)> GetLocationNPCs(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spNPCs_GetLocationNPCs",
                                                   new { id },
                                                   ConnStringName,
                                                   true);
    }

    public List<(int id, string name)> GetLocationResources(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spBT_LocationResourceRelations_GetLocationResources",
                                                   new { id },
                                                   ConnStringName,
                                                   true);
    }

    public FullArtifactModel? GetFullArtifactInfoById(int id)
    {
        var model = _db.QueryDB<FullArtifactModel, dynamic>("Lore.spArtifacts_GetFullInfoById",
                                                       new { id },
                                                       ConnStringName,
                                                       true).FirstOrDefault();
        if (model != null)
        {
            model.NotableEvents = GetArtifactEvents(id);
        }
        return model;
    }

    public List<(int id, string name)> GetArtifactEvents(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spBT_EventArtifactRelations_GetArtifactEvents",
                                                           new { id },
                                                           ConnStringName,
                                                           true);
    }

    public FullEventModel? GetFullEventInfoById(int id)
    {
        var model = _db.QueryDB<FullEventModel, dynamic>("Lore.spEvents_GetFullInfoById",
                                                         new { id },
                                                         ConnStringName,
                                                         true).FirstOrDefault();
        if (model != null)
        {
            model.NotableArtifacts = GetEventArtifacts(id);
            model.NotableFactions = GetEventFactions(id);
            model.NotableLocations = GetEventLocations(id);
            model.NotableNPCs = GetEventNPCs(id);
        }
        return model;
    }

    public List<(int id, string name)> GetEventArtifacts(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spBT_EventArtifactRelations_GetEventArtifacts",
                                                           new { id },
                                                           ConnStringName,
                                                           true);
    }

    public List<(int id, string name)> GetEventFactions(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spBT_EventFactionRelations_GetEventFactions",
                                                           new { id },
                                                           ConnStringName,
                                                           true);
    }

    public List<(int id, string name)> GetEventLocations(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spBT_LocationEventRelations_GetEventLocations",
                                                   new { id },
                                                   ConnStringName,
                                                   true);
    }

    public List<(int id, string name)> GetEventNPCs(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spBT_NPCEventRelations_GetEventNPCs",
                                                   new { id },
                                                   ConnStringName,
                                                   true);
    }

    public FullFactionModel? GetFullFactionInfoById(int id)
    {
        var model = _db.QueryDB<FullFactionModel, dynamic>("Lore.spFactions_GetFullInfoById",
                                                           new { id },
                                                           ConnStringName,
                                                           true).FirstOrDefault();

        if (model != null)
        {
            model.NotableCreatedArtifacts = GetFactionCreatedArtifacts(id);
            model.NotableOwnedArtifacts = GetFactionOwnedArtifacts(id);
            model.NotableEvents = GetFactionEvents(id);
            model.NotableLocations = GetFactionLocations(id);
            model.NotableNPCs = GetFactionNPCs(id);
        }
        return model;
    }

    public List<(int id, string name)> GetFactionCreatedArtifacts(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spArtifacts_GetFactionCreatedArtifacts",
                                                           new { id },
                                                           ConnStringName,
                                                           true);
    }

    public List<(int id, string name)> GetFactionOwnedArtifacts(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spArtifacts_GetFactionOwnedArtifacts",
                                                           new { id },
                                                           ConnStringName,
                                                           true);
    }

    public List<(int id, string name)> GetFactionEvents(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spBT_EventFactionRelations_GetFactionEvents",
                                                           new { id },
                                                           ConnStringName,
                                                           true);
    }

    public List<(int id, string name)> GetFactionLocations(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spBT_LocationFactionRelations_GetFactionLocations",
                                                           new { id },
                                                           ConnStringName,
                                                           true);
    }

    public List<(int id, string name)> GetFactionNPCs(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spBT_NPCFactionRelations_GetFactionNPCs",
                                                           new { id },
                                                           ConnStringName,
                                                           true);
    }

    public FullHistoricalAgeModel? GetFullHistoricalAgeInfoById(int id)
    {
        var model = _db.QueryDB<FullHistoricalAgeModel, dynamic>("Lore.spHistoricalAges_GetFullInfoById",
                                                                 new { id },
                                                                 ConnStringName,
                                                                 true).FirstOrDefault();
        if (model != null)
        {
            model.NotableLivingNPCs = GetHistoricalAgeLivingNPCs(id);
            model.NotableDeadNPCs = GetHistoricalAgeDeadNPCs(id);
            model.NotableCreatedArtifacts = GetHistoricalAgeCreatedArtifacts(id);
            model.NotableLostArtifacts = GetHistoricalAgeLostArtifacts(id);
            model.NotableBeginingEvents = GetHistoricalAgeBeginingEvents(id);
            model.NotableEndingEvents = GetHistorcalAgeEndingEvents(id);
            model.NotableFoundingFactions = GetHistoricalAgeFoundingFactions(id);
            model.NotableDisbandingFactions = GetHistoricalAgeDisbandingFactions(id);
        }
        return model;
    }

    public List<(int id, string name)> GetHistoricalAgeLivingNPCs(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spNPCs_GetHistoricalAgeLivingNPCs",
                                                           new { id },
                                                           ConnStringName,
                                                           true);
    }

    public List<(int id, string name)> GetHistoricalAgeDeadNPCs(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spNPCs_GetHistoricalAgeDeadNPCs",
                                                       new { id },
                                                       ConnStringName,
                                                       true);

    }

    public List<(int id, string name)> GetHistoricalAgeCreatedArtifacts(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spArtifacts_GetHistoricalAgeCreatedArtifacts",
                                                           new { id },
                                                           ConnStringName,
                                                           true);
    }

    public List<(int id, string name)> GetHistoricalAgeLostArtifacts(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spArtifacts_GetHistoricalAgeLostArtifacts",
                                                           new { id },
                                                           ConnStringName,
                                                           true);
    }

    public List<(int id, string name)> GetHistoricalAgeBeginingEvents(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spEvents_GetHistoricalAgeBeginingEvents",
                                                           new { id },
                                                           ConnStringName,
                                                           true);
    }

    public List<(int id, string name)> GetHistorcalAgeEndingEvents(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spEvents_GetHistoricalAgeEndingEvents",
                                                           new { id },
                                                           ConnStringName,
                                                           true);

    }

    public List<(int id, string name)> GetHistoricalAgeFoundingFactions(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spFactions_GetHistoricalAgeFoundingFactions",
                                                           new { id },
                                                           ConnStringName,
                                                           true);
    }

    public List<(int id, string name)> GetHistoricalAgeDisbandingFactions(int id)
    {
        return _db.QueryDB<(int id, string name), dynamic>("Lore.spFactions_GetHistoricalAgeDisbandingFactions",
                                                   new { id },
                                                   ConnStringName,
                                                   true);

    }
}
