namespace DataAccess.Models.LoreModels;

/// <summary>
/// Represents a location in the game setting
/// </summary>
/// <param name="id">id from db</param>
/// <param name="name">name of location (req)</param>
/// <param name="description">description of location</param>
/// <param name="rulingGovernmentId">ruling faction id FK(Factions)</param>
/// <param name="rulerId">ruling NPC id FK(NPCs)</param>
/// <param name="containingLocationId">location that holds this location FK(Locations - same 
/// table)</param>
public class LocationModel(int id,
                           string name,
                           string? description,
                           int? rulingGovernmentId,
                           int? rulerId,
                           int? containingLocationId)
{
    public int Id { get; set; } = id;
    public string Name { get; set; } = name;
    public string? Description { get; set; } = description;
    public int? RulingGovernmentId { get; set; } = rulingGovernmentId; // FK (Factions)
    public int? RulerId { get; set; } = rulerId; // FK (NPCs)
    public int? ContainingLocationId { get; set; } = containingLocationId; // FK (Locations) - Same table
    public bool HasSubLocations { get; set; }
}


/// <summary>
/// Represents a location in the game setting as its being built (such as in CLI tool)
/// </summary>
/// <param name="name">name of location (req)</param>
public class LoadingLocationModel(string name)
{
    public string Name { get; set; } = name;
    public string? Description { get; set; }
    public int? RulingGovernmentId { get; set; } // FK (Factions)
    public int? RulerId { get; set; } // FK (NPCs)
    public int? ContainingLocationId { get; set; } // FK (Locations) - Same table
}
