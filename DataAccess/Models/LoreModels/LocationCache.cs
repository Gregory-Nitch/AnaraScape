namespace DataAccess.Models.LoreModels;

public class LocationCache
{
    public LocationCache(ICrud crud)
    {
        Locations = [.. crud.GetAllLocations()];
    }

    public List<LocationModel> Locations { get; }
}
