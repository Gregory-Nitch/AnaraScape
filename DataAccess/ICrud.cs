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
    public List<(int id, string name)> GetArtifactsLike(string likeName);
    public List<(int id, string name)> GetEventsLike(string likeName);
    public List<(int id, string name)> GetFactionsLike(string likeName);
    public List<(int id, string name)> GetGeoMapsLike(string likeName);
    public List<(int id, string name)> GetLocationsLike(string likeName);
    public List<(int id, string name)> GetNPCsLike(string likeName);
    public List<(int id, string name)> GetResourcesLike(string likeName);
    public List<(int id, string name)> GetTerminologiesLike(string likeName);
    public FullLocationModel? GetFullLocationInfoById(int id);
    public List<(int id, string name)> GetLocationArtifacts(int id);
    public List<(int id, string name)> GetLocationEvents(int id);
    public List<(int id, string name)> GetLocationFactions(int id);
    public List<(int id, string name)> GetLocationNPCs(int id);
    public List<(int id, string name)> GetLocationResources(int id);

    public FullArtifactModel? GetFullArtifactInfoById(int id);
    public List<(int id, string name)> GetArtifactEvents(int id);
    public FullEventModel? GetFullEventInfoById(int id);
    public List<(int id, string name)> GetEventArtifacts(int id);
    public List<(int id, string name)> GetEventFactions(int id);
    public List<(int id, string name)> GetEventLocations(int id);
    public List<(int id, string name)> GetEventNPCs(int id);
    public FullFactionModel? GetFullFactionInfoById(int id);
    public List<(int id, string name)> GetFactionCreatedArtifacts(int id);
    public List<(int id, string name)> GetFactionOwnedArtifacts(int id);
    public List<(int id, string name)> GetFactionEvents(int id);
    public List<(int id, string name)> GetFactionLocations(int id);
    public List<(int id, string name)> GetFactionNPCs(int id);
    public FullHistoricalAgeModel? GetFullHistoricalAgeInfoById(int id);
    public List<(int id, string name)> GetHistoricalAgeLivingNPCs(int id);
    public List<(int id, string name)> GetHistoricalAgeDeadNPCs(int id);
    public List<(int id, string name)> GetHistoricalAgeCreatedArtifacts(int id);
    public List<(int id, string name)> GetHistoricalAgeLostArtifacts(int id);
    public List<(int id, string name)> GetHistoricalAgeBeginingEvents(int id);
    public List<(int id, string name)> GetHistorcalAgeEndingEvents(int id);
    public List<(int id, string name)> GetHistoricalAgeFoundingFactions(int id);
    public List<(int id, string name)> GetHistoricalAgeDisbandingFactions(int id);
    public FullNPCModel? GetFullNPCInfoById(int id);
    public List<(int id, string name)> GetNPCLeadingFactions(int id);
    public List<(int id, string name)> GetNPCMemberFactions(int id);
    public List<(int id, string name)> GetNPCEvents(int id);
    public List<(int id, string name)> GetNPCRulingLocations(int id);
    public List<(int id, string name)> GetNPCCreatedArtifacts(int id);
    public List<(int id, string name)> GetNPCOwnedArtifacts(int id);
    public List<(int id, string name)> GetNPCTerms(int id);
    public FullResourceModel? GetFullResourceInfoById(int id);
    public List<(int id, string name)> GetResourceLocations(int id);
    public FullTerminologyModel? GetFullTerminologyInfoById(int id);
    public int UpdateAllSublocationFlags();
}
