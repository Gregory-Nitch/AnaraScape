namespace DataAccess.Models.LoreModels;

/// <summary>
/// Represents an artifact in the game setting
/// </summary>
/// <param name="storedModel">model data from database</param>
public class ArtifactModel(StoredArtifactModel storedModel)
{
    public int Id { get; set; } = storedModel.Id;
    public string Name { get; set; } = storedModel.Name;
    public string? Description { get; set; } = storedModel?.Description;
    public int? LocationId { get; set; } = storedModel?.LocationId; // FK (Locations)
    public EntityType? OwnerType { get; set; } = storedModel?.OwnerType;
    public int? NPCOwnerId { get; set; } = storedModel?.NPCOwnerId; // FK (NPCs)
    public int? FactionOwnerId { get; set; } = storedModel?.FactionOwnerId; // FK (Factions)
    public EntityType? CreatorType { get; set; } = storedModel?.CreatorType;
    public int? NPCCreatorId { get; set; } = storedModel?.NPCCreatorId; // FK (NPCs)
    public int? FactionCreatorId { get; set; } = storedModel?.FactionCreatorId; // FK (Factions)
    public AnaraDate? CreationDate { get; set; } = storedModel?.CreationDate != null ?
                                                   AnaraDate.ParseFromString(storedModel.CreationDate) 
                                                   : null;
    public int? CreationAgeId { get; set; } = storedModel?.CreationAgeId; // FK (HistoricalAges)
    public AnaraDate? LostDate { get; set; } = storedModel?.LostDate != null ?
                                               AnaraDate.ParseFromString(storedModel.LostDate) 
                                               : null;
    public int? LostAgeId { get; set; } = storedModel?.LostAgeId; // FK (HistoricalAges)
}


/// <summary>
/// Artifact model data in its database form.
/// </summary>
/// <param name="id">id from db</param>
/// <param name="name">name of artifact</param>
/// <param name="description">description of artifact</param>
/// <param name="locationId">location id FK(Locations)</param>
/// <param name="ownerType">enum owner type (NPC||Faction)</param>
/// <param name="nPCOwnerId">id of owner if NPC FK(NPCs)</param>
/// <param name="factionOwnerId">id of owner if Faction FK(Factions)</param>
/// <param name="creatorType">enum creator type (NPC||Faction)</param>
/// <param name="nPCCreatorId">id of creator if NPC FK(NPCs)</param>
/// <param name="factionCreatorId">id of creator if faction FK(Factions)</param>
/// <param name="creationDate">creation date in string form</param>
/// <param name="creationAgeId">creation age id FK(HistoricalAges)</param>
/// <param name="lostDate">lost date in string form</param>
/// <param name="lostAgeId">lost age id FK(HistoricalAges)</param>
public class StoredArtifactModel(int id,
                                 string name,
                                 string? description,
                                 int? locationId,
                                 EntityType? ownerType,
                                 int? nPCOwnerId,
                                 int? factionOwnerId,
                                 EntityType? creatorType,
                                 int? nPCCreatorId,
                                 int? factionCreatorId,
                                 string? creationDate,
                                 int? creationAgeId,
                                 string? lostDate,
                                 int? lostAgeId)
{
    public int Id { get; set; } = id;
    public string Name { get; set; } = name ?? throw new ArgumentNullException(nameof(name));
    public string? Description { get; set; } = description;
    public int? LocationId { get; set; } = locationId; // FK (Locations)
    public EntityType? OwnerType { get; set; } = ownerType;
    public int? NPCOwnerId { get; set; } = nPCOwnerId; // FK (NPCs)
    public int? FactionOwnerId { get; set; } = factionOwnerId; // FK (Factions)
    public EntityType? CreatorType { get; set; } = creatorType;
    public int? NPCCreatorId { get; set; } = nPCCreatorId; // FK (NPCs)
    public int? FactionCreatorId { get; set; } = factionCreatorId; // FK (Factions)
    public string? CreationDate { get; set; } = creationDate;
    public int? CreationAgeId { get; set; } = creationAgeId; // FK (HistoricalAges)
    public string? LostDate { get; set; } = lostDate;
    public int? LostAgeId { get; set; } = lostAgeId; // FK (HistoricalAges)
}


/// <summary>
/// Represents an artifact as it is being build for loading (such as with CLI tool)
/// </summary>
/// <param name="name">name of the artifact</param>
public class LoadingArtifactModel(string name)
{
    public string Name { get; set; } = name;
    public string? Description { get; set; }
    public int? LocationId { get; set; } // FK (Locations)
    public EntityType? OwnerType { get; set; }
    public int? NPCOwnerId { get; set; } // FK (NPCs)
    public int? FactionOwnerId { get; set; } // FK (Factions)
    public EntityType? CreatorType { get; set; }
    public int? NPCCreatorId { get; set; } // FK (NPCs)
    public int? FactionCreatorId { get; set; } // FK (Factions)
    public string? CreationDate { get; set; }
    public int? CreationAgeId { get; set; } // FK (HistoricalAges)
    public string? LostDate { get; set; }
    public int? LostAgeId { get; set; } // FK (HistoricalAges)
}


/// <summary>
/// Used to determine artifact owner/creator type
/// </summary>
public enum EntityType
{
    NPC,
    Faction
}
