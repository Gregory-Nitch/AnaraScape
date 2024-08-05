namespace DataAccess.Models.LoreModels;


/// <summary>
/// Represents a location and resource relationship.
/// </summary>
/// <param name="locationId">location id (FK Locations)</param>
/// <param name="resourceId">resource id (FK Resources)</param>
/// <param name="locationName">location name from db</param>
/// <param name="resourceName">resource name from db</param>
public class LocationResourceRelationModel(int locationId,
                                           int resourceId,
                                           string locationName,
                                           string resourceName)
{
    public int LocationId { get; set; } = locationId; // FK Locations
    public int ResourceId { get; set; } = resourceId; // FK Resources
    public string LocationName { get; set; } = locationName;
    public string ResourceName { get; set; } = resourceName;
}


/// <summary>
/// Represents a location and resource relationship as it is being built.
/// </summary>
/// <param name="locationId">location id (FK Locations)</param>
/// <param name="resourceId">resource id (FK Resources)</param>
public class LoadingLocationResourceRelationModel(int locationId, int resourceId)
{
    public int LocationId { get; set; } = locationId; // FK Locations
    public int ResourceId { get; set; } = resourceId; // FK Resources
}
