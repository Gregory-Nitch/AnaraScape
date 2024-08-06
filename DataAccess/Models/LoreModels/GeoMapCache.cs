namespace DataAccess.Models.LoreModels;

public class GeoMapCache(ICrud crud)
{
    public List<GeoMapModel> GeoMaps { get; } = [.. crud.GetAllGeoMaps()];
}
