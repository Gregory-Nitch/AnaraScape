namespace DataAccess.Models.LoreModels;


/// <summary>
/// Represents a location and faction relationship.
/// </summary>
/// <param name="locationId">location id (FK Locations)</param>
/// <param name="factionId">faction id (FK Factions)</param>
/// <param name="locationName">location name from database</param>
/// <param name="factionName">faction name from database</param>
public class LocationFactionRelationModel(int locationId,
                                          int factionId,
                                          string locationName,
                                          string factionName)
{
    public int LocationId { get; set; } = locationId; // FK Locations
    public int FactionId { get; set; } = factionId; // FK Factions
    public string LocationName { get; set; } = locationName;
    public string FactionName { get; set; } = factionName;
}


/// <summary>
/// Represents a location and faction relationship as it is being loaded.
/// </summary>
/// <param name="locationId">location id (FK Locations)</param>
/// <param name="factionId">faction id (FK Factions)</param>
public class LoadingLocationFactionRelationModel(int locationId, int factionId)
{
    public int LocationId { get; set; } = locationId; // FK Locations
    public int FactionId { get; set; } = factionId; // FK Factions
}
