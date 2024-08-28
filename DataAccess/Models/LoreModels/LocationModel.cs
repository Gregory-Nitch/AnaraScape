
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
                           int? containingLocationId,
                           bool hasSubLocations)
{
    public int Id { get; set; } = id;
    public string Name { get; set; } = name;
    public string? Description { get; set; } = description;
    public int? RulingGovernmentId { get; set; } = rulingGovernmentId; // FK (Factions)
    public int? RulerId { get; set; } = rulerId; // FK (NPCs)
    public int? ContainingLocationId { get; set; } = containingLocationId; // FK (Locations) - Same table
    public bool HasSubLocations { get; set; } = hasSubLocations;
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
    public bool HasSubLocations { get; set; }
}

/// <summary>
/// Represents a location in the game setting, in addition to all relational information.
/// </summary>
/// <param name="id">id from db</param>
/// <param name="name">name of location (req)</param>
/// <param name="description">description of location</param>
/// <param name="rulingGovernmentId">ruling faction id FK(Factions)</param>
/// <param name="rulerId">ruling NPC id FK(NPCs)</param>
/// <param name="containingLocationId">location that holds this location FK(Locations - same 
/// table)</param>
/// <param name="governmentName">ruling government name</param>
/// <param name="rulerName">ruler name</param>
/// <param name="containingLocationName">containing location name</param>
public class FullLocationModel(int id,
                           string name,
                           string? description,
                           int? rulingGovernmentId,
                           int? rulerId,
                           int? containingLocationId,
                           string? rulingGovernmentName,
                           string? rulerName,
                           string? containingLocationName,
                           string? mapFilename,
                           string? mapName)
{
    public int Id { get; set; } = id;
    public string Name { get; set; } = name;
    public string? Description { get; set; } = description;
    public int? RulingGovernmentId { get; set; } = rulingGovernmentId; // FK (Factions)
    public int? RulerId { get; set; } = rulerId; // FK (NPCs)
    public int? ContainingLocationId { get; set; } = containingLocationId; // FK (Locations) - Same table
    public string? RulingGovernmentName { get; set; } = rulingGovernmentName;
    public string? RulerName { get; set; } = rulerName;
    public string? ContainingLocationName { get; set; } = containingLocationName;
    public string? MapFilename { get; set; } = mapFilename;
    public string? MapName { get; set; } = mapName;
    public List<LocationModel> SubLocations { get; set; }
    public List<(int id, string name)> NotableArtifacts { get; set; }
    public List<(int id, string name)> NotableEvents { get; set; }
    public List<(int id, string name)> NotableFactions { get; set; }
    public List<(int id, string name)> NotableNPCs { get; set; }
    public List<(int id, string name)> NotableResources { get; set; }


    public void PopulateRelations(LocationCache locCache, ICrud crud)
    {
        GetSubLocations(locCache);
        GetArtifacts(crud);
        GetEvents(crud);
        GetFactions(crud);
        GetNPCs(crud);
        GetResources(crud);
    }

    private void GetResources(ICrud crud)
    {
        NotableResources = crud.GetLocationResources(Id);
    }

    private void GetNPCs(ICrud crud)
    {
        NotableNPCs = crud.GetLocationNPCs(Id);
    }

    private void GetFactions(ICrud crud)
    {
        NotableFactions = crud.GetLocationFactions(Id);
    }

    private void GetEvents(ICrud crud)
    {
        NotableEvents = crud.GetLocationEvents(Id);
    }

    private void GetArtifacts(ICrud crud)
    {
        NotableArtifacts = crud.GetLocationArtifacts(Id);
    }

    private void GetSubLocations(LocationCache locCache)
    {
        SubLocations = [.. locCache.Locations.Where(l => l.ContainingLocationId == Id)];
    }
}
