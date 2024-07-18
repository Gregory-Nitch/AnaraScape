using DataAccess.Models.DungeonModels;
using DataAccess.Models.LoggingModels;

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
}
