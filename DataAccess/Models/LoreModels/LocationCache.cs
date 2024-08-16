namespace DataAccess.Models.LoreModels;

public class LocationCache
{
    public LocationCache(ICrud crud)
    {
        Locations = [.. crud.GetAllLocations()];

        foreach (var location in Locations)
        {
            if (Locations.Any(l => l.ContainingLocationId == location.Id))
            {
                location.HasSubLocations = true;
            }
        }
    }

    public List<LocationModel> Locations { get; }
}
