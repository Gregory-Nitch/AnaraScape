namespace DataAccess.Models.LoreModels;

/// <summary>
/// Used to store all the locations in the database for quick access that prevents multilple calls 
/// to the database.
/// </summary>
public class LocationCache
{
    /// <summary>
    /// Builds a location cache and returns locations ordered by name.
    /// </summary>
    /// <param name="crud">object to query the database</param>
    public LocationCache(ICrud crud)
    {
        crud.UpdateAllSublocationFlags();
        Locations = [.. crud.GetAllLocations().OrderBy(l => l.Name)];
    }

    public List<LocationModel> Locations { get; }
}
