namespace DataAccess.Models.LoreModels;

public class LocationCache
{
    public LocationCache(ICrud crud)
    {
        Locations = [.. crud.GetAllLocations()];

        foreach (var location in Locations)
        {
            if (Locations.Any(l => l.ContainingLocationId == location.Id))
            {// TODO Change this to a CLI tool that persists in DB 
                location.HasSubLocations = true;
            }
        }
    }

    public List<LocationModel> Locations { get; }
}
