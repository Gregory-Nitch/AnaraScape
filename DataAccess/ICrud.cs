using DataAccess.Models.DungeonModels;
using DataAccess.Models.LoggingModels;
using DataAccess.Models.LoreModels;

namespace DataAccess;

/// <summary>
/// Represents the required implementation for CRUD objects
/// </summary>
public interface ICrud
{
    public void InsertTile(LoadingDungeonTileModel tile);
    public void DeleteAllTiles();
    public List<StoredDungeonTileModel> GetAllTiles();
    public void InsertLogEvent(LogEvent evt);
    public List<LogEvent> GetAllLogEvents();
    public List<LogEvent> GetLogsAfter(DateTime date);
    public List<LogEvent> GetLogsBefore(DateTime date);
    public List<LogEvent> GetLogsInRange(DateTime beginDate, DateTime endDate);
    public void InsertLore<T>(T loreObj, LoreTable table);
    public List<StoredArtifactModel> GetAllArtifacts();
    public List<StoredEventModel> GetAllEvents();
    public List<StoredFactionModel> GetAllFactions();
    public List<GeoMapModel> GetAllGeoMaps();
    public List<HistoricalAgeModel> GetAllHistoricalAges();
    public List<LocationModel> GetAllLocations();
    public List<StoredNPCModel> GetAllNPCs();
    public List<ResourceModel> GetAllResources();
    public List<StoredTerminologyModel> GetAllTerms();
    public List<EventArtifactRelationModel> GetAllEventArtifactRelations();
    public List<EventFactionRelationModel> GetAllEventFactionRelations();
    public List<LocationEventRelationModel> GetAllLocationEventRelations();
    public List<LocationFactionRelationModel> GetAllLocationFactionRelations();
    public List<LocationResourceRelationModel> GetAllLocationResourceRelations();
    public List<NPCEventRelationModel> GetAllNPCEventRelations();
    public List<NPCFactionRelationModel> GetAllNPCFactionRelations();
    public StoredArtifactModel? GetStoredArtifactById(int id);
    public StoredEventModel? GetStoredEventById(int id);
    public StoredFactionModel? GetStoredFactionById(int id);
    public GeoMapModel? GetGeoMapById(int id);
    public HistoricalAgeModel? GetHistoricalAgeById(int id);
    public LocationModel? GetLocationById(int id);
    public StoredNPCModel? GetStoredNPCById(int id);
    public ResourceModel? GetResourceById(int id);
    public StoredTerminologyModel? GetStoredTerminologyById(int id);
    public EventArtifactRelationModel? GetEventArtifactRelationByCompositeId(int eventId,
                                                                              int artifactId);
    public EventFactionRelationModel? GetEventFactionRelationByCompositeId(int eventId,
                                                                          int factionId);
    public LocationEventRelationModel? GetLocationEventRelationByCompositeId(int LocationId,
                                                                            int eventId);
    public LocationFactionRelationModel? GetLocationFactionRelationByCompositeId(int locationId,
                                                                                int factionId);
    public LocationResourceRelationModel? GetLocationResourceRelationByCompositeId(int locationId,
                                                                                  int resourceId);
    public NPCEventRelationModel? GetNPCEventRelationByCompositeId(int npcId, int eventId);
    public NPCFactionRelationModel? GetNPCFactionRelationByCompositeId(int npcId, int factionId);
    public void UpdateLore<T>(T loreObj, LoreTable table);
    public void UpdateEventArtifactRelationByCompositeId(int eventId,
                                                         int artifactId,
                                                         int oldEventId,
                                                         int oldArtifactId);
    public void UpdateEventFactionRelationByCompositeId(int eventId,
                                                        int factionId,
                                                        int oldEventId,
                                                        int oldFactionId);
    public void UpdateLocationEventRelationByCompositeId(int locationId,
                                                         int eventId,
                                                         int oldLocationId,
                                                         int oldEventId);
    public void UpdateLocationFactionRelationByCompositeId(int locationId,
                                                           int factionId,
                                                           int oldLocationId,
                                                           int oldFactionId);
    public void UpdateLocationResourceRelationByCompositeId(int locationId,
                                                            int resourceId,
                                                            int oldLocationId,
                                                            int oldResourceId);
    public void UpdateNPCEventRelationsByCompositeId(int npcId,
                                                     int eventId,
                                                     int oldNPCId,
                                                     int oldEventId);
    public void UpdateNPCFactionRelationByCompositeId(int npcId,
                                                      int factionId,
                                                      int oldNPCId,
                                                      int oldFactionId);
    public void DeleteLoreById(int id, LoreTable table);
    public void DeleteEventArtifactRelationByCompositeId(int eventId, int artifactId);
    public void DeleteEventFactionRelationByCompositeId(int eventId, int factionId);
    public void DeleteLocationEventRelationByCompositeId(int locationId, int eventId);
    public void DeleteLocationFactionRelationByCompositeId(int locationId, int factionId);
    public void DeleteLocationResourceRelationByCompositeId(int locationId, int resourceId);
    public void DeleteNPCEventRelationsByCompositeId(int npcId, int eventId);
    public void DeleteNPCFactionRelationByCompositeId(int npcId, int factionId);
}
