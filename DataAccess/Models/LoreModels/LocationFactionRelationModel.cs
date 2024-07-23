namespace DataAccess.Models.LoreModels;

public class LocationFactionRelationModel(int locationId, int factionId)
{
    public int LocationId { get; set; } = locationId;
    public int FactionId { get; set; } = factionId;
}
