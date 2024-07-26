namespace DataAccess.Models.LoreModels;

public class LocationEventRelationModel(int locationId,
                                        int eventId,
                                        string locationName,
                                        string eventName)
{
    public int LocationId { get; set; } = locationId;
    public int EventId { get; set; } = eventId;
    public string LocationName { get; set; } = locationName;
    public string EventName { get; set; } = eventName;
}
