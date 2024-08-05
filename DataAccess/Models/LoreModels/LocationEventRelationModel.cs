namespace DataAccess.Models.LoreModels;

/// <summary>
/// Represents a location and event relationship.
/// </summary>
/// <param name="locationId">location id (FK Locations)</param>
/// <param name="eventId">event id (FK Events)</param>
/// <param name="locationName">location name from db</param>
/// <param name="eventName">event name from db</param>
public class LocationEventRelationModel(int locationId,
                                        int eventId,
                                        string locationName,
                                        string eventName)
{
    public int LocationId { get; set; } = locationId; // FK Locations
    public int EventId { get; set; } = eventId; // FK Events
    public string LocationName { get; set; } = locationName;
    public string EventName { get; set; } = eventName;
}


/// <summary>
/// Represents a location and event relationship as it is being loaded.
/// </summary>
/// <param name="locationId">location id (FK Locations)</param>
/// <param name="eventId">event id (FK Events)</param>
public class LoadingLocationEventRelationModel(int locationId, int eventId)
{
    public int LocationId { get; set; } = locationId; // FK Locations
    public int EventId { get; set; } = eventId; // FK Events
}
