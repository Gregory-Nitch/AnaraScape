namespace DataAccess.Models.LoreModels;

public class LocationFactionRelationModel(int locationId,
                                          int factionId,
                                          string locationName,
                                          string factionName)
{
    public int LocationId { get; set; } = locationId;
    public int FactionId { get; set; } = factionId;
    public string LocationName { get; set; } = locationName;
    public string FactionName { get; set; } = factionName;
}

public class LoadingLocationFactionRelationModel(int locationId, int factionId)
{
    public int LocationId { get; set; } = locationId;
    public int FactionId { get; set; } = factionId;
}
