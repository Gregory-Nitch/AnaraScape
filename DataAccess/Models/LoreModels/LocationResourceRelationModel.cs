namespace DataAccess.Models.LoreModels;

public class LocationResourceRelationModel(int locationId, int resourceId)
{
    public int LocationId { get; set; } = locationId;
    public int ResourceId { get; set; } = resourceId;
}
