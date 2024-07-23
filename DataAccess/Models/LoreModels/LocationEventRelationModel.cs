namespace DataAccess.Models.LoreModels;

public class LocationEventRelationModel(int locationId, int eventId)
{
    public int LocationId { get; set; } = locationId;
    public int EventId { get; set; } = eventId;
}
