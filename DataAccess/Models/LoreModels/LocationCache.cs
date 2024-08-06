namespace DataAccess.Models.LoreModels;

public class LocationCache(ICrud crud)
{
    public List<LocationModel> Locations { get; } = [.. crud.GetAllLocations()];
}
