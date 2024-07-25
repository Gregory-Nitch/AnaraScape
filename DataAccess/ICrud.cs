using DataAccess.Models.DungeonModels;
using DataAccess.Models.LoggingModels;
using DataAccess.Models.LoreModels;

namespace DataAccess;

/// <summary>
/// Represents the required implmentation for CRUD objects
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
}
