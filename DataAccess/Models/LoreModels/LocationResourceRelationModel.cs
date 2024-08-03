namespace DataAccess.Models.LoreModels;

public class LocationResourceRelationModel(int locationId,
                                           int resourceId,
                                           string locationName,
                                           string resourceName)
{
    public int LocationId { get; set; } = locationId;
    public int ResourceId { get; set; } = resourceId;
    public string LocationName { get; set; } = locationName;
    public string ResourceName { get; set; } = resourceName;
}

public class LoadingLocationResourceRelationModel(int locationId, int resourceId)
{
    public int LocationId { get; set; } = locationId;
    public int ResourceId { get; set; } = resourceId;
}
