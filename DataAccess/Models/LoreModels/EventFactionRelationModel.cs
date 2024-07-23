namespace DataAccess.Models.LoreModels;

public class EventFactionRelationModel(int eventId, int factionId)
{
    public int EventId { get; set; } = eventId;
    public int FactionId { get; set; } = factionId;
}
