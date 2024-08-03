namespace DataAccess.Models.LoreModels;

public class EventFactionRelationModel(int eventId,
                                       int factionId,
                                       string eventName,
                                       string factionName)
{
    public int EventId { get; set; } = eventId;
    public int FactionId { get; set; } = factionId;
    public string EventName { get; set; } = eventName;
    public string FactionName { get; set; } = factionName; 
}

public class LoadingEventFactionRelationModel(int eventId,int factionId)
{
    public int EventId { get; set; } = eventId;
    public int FactionId { get; set; } = factionId;
}
