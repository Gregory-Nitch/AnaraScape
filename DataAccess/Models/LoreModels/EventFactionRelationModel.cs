namespace DataAccess.Models.LoreModels;

/// <summary>
/// Represents an event and faction relationship.
/// </summary>
/// <param name="eventId">event id (FK Events)</param>
/// <param name="factionId">faction id (FK Factions)</param>
/// <param name="eventName">event name from db</param>
/// <param name="factionName">faction name from db</param>
public class EventFactionRelationModel(int eventId,
                                       int factionId,
                                       string eventName,
                                       string factionName)
{
    public int EventId { get; set; } = eventId; // FK Events
    public int FactionId { get; set; } = factionId; // FK Factions
    public string EventName { get; set; } = eventName;
    public string FactionName { get; set; } = factionName; 
}


/// <summary>
/// Represents an event and faction relationship as it is being loaded.
/// </summary>
/// <param name="eventId">event id (FK Events)</param>
/// <param name="factionId">faction id (FK Factions)</param>
public class LoadingEventFactionRelationModel(int eventId,int factionId)
{
    public int EventId { get; set; } = eventId; // FK Events
    public int FactionId { get; set; } = factionId; // FK Factions
}
