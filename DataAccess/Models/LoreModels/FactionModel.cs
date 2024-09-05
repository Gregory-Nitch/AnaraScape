namespace DataAccess.Models.LoreModels;

/// <summary>
/// Represents a faction in the game setting.
/// </summary>
/// <param name="storedModel">stored model from database</param>
public class FactionModel(StoredFactionModel storedModel)
{
    public int Id { get; set; } = storedModel.Id;
    public string Name { get; set; } = storedModel.Name;
    public string? Description { get; set; } = storedModel.Description;
    public int? LeaderId { get; set; } = storedModel.LeaderId; // FK NPCs
    public AnaraDate? FoundingDate { get; set; } =
        storedModel.FoundingDate != null ? AnaraDate.ParseFromString(storedModel.FoundingDate) : null;
    public int? FoundingAgeId { get; set; } = storedModel.FoundingAgeId; // FK Historical Ages
    public AnaraDate? DisbandDate { get; set; } =
        storedModel.DisbandDate != null ? AnaraDate.ParseFromString(storedModel.DisbandDate) : null;
    public int? DisbandAgeId { get; set; } = storedModel.DisbandAgeId; // FK Historical Ages
}


/// <summary>
/// Faction model as it is stored in the database.
/// </summary>
/// <param name="id">id from db</param>
/// <param name="name">name of faction</param>
/// <param name="description">description of faction</param>
/// <param name="leaderId">leader of the faction FK(NPCs)</param>
/// <param name="foundingDate">founding date in string form</param>
/// <param name="foundingAgeId">founding age id FK(HistoricalAges)</param>
/// <param name="disbandDate">disband date in string form</param>
/// <param name="disbandAgeId">disband age id FK(HistoricalAges)</param>
public class StoredFactionModel(int id,
                                string name,
                                string? description,
                                int? leaderId,
                                string? foundingDate,
                                int? foundingAgeId,
                                string? disbandDate,
                                int? disbandAgeId)
{
    public int Id { get; set; } = id;
    public string Name { get; set; } = name ?? throw new ArgumentNullException(nameof(name));
    public string? Description { get; set; } = description;
    public int? LeaderId { get; set; } = leaderId; // FK NPCs
    public string? FoundingDate { get; set; } = foundingDate;
    public int? FoundingAgeId { get; set; } = foundingAgeId; // FK Historical Ages
    public string? DisbandDate { get; set; } = disbandDate;
    public int? DisbandAgeId { get; set; } = disbandAgeId; // FK Historical Ages
}


/// <summary>
/// Model as it is being built for entry into database (such as CLI tool)
/// </summary>
/// <param name="name">name of faction</param>
public class LoadingFactionModel(string name)
{
    public string Name { get; set; } = name ?? throw new ArgumentNullException(nameof(name));
    public string? Description { get; set; }
    public int? LeaderId { get; set; } // FK NPCs
    public string? FoundingDate { get; set; }
    public int? FoundingAgeId { get; set; } // FK Historical Ages
    public string? DisbandDate { get; set; }
    public int? DisbandAgeId { get; set; } // FK Historical Ages
}

/// <summary>
/// Represents a faction in the setting with all of it's realationships.
/// </summary>
/// <param name="id">id from db</param>
/// <param name="name">name of the faction</param>
/// <param name="description">description of the faction</param>
/// <param name="leaderId">leader id (FK NPCs)</param>
/// <param name="leaderName">leader name</param>
/// <param name="foundingDate">founding date (as string)</param>
/// <param name="foundingAgeId">founding age id (FK HistoricalAges)</param>
/// <param name="foundingAge">founding age (enum)</param>
/// <param name="disbandDate">disband date (as string)</param>
/// <param name="disbandAgeId">disband age id (FK HistoricalAges)</param>
/// <param name="disbandAge">diband age (enum)</param>
public class FullFactionModel(int id,
                              string name,
                              string? description,
                              int? leaderId,
                              string? leaderName,
                              string? foundingDate,
                              int? foundingAgeId,
                              AnaraAge? foundingAge,
                              string? disbandDate,
                              int? disbandAgeId,
                              AnaraAge? disbandAge)
{
    public int Id { get; set; } = id;
    public string Name { get; set; } = name;
    public string? Description { get; set; } = description;
    public int? LeaderId { get; set; } = leaderId; // FK NPCs
    public string? LeaderName { get; } = leaderName;
    public AnaraDate? FoundingDate { get; set; } =
        foundingDate != null ? AnaraDate.ParseFromString(foundingDate) : null;
    public int? FoundingAgeId { get; set; } = foundingAgeId; // FK Historical Ages
    public AnaraAge? FoundingAge { get; } = foundingAge;
    public AnaraDate? DisbandDate { get; set; } =
        disbandDate != null ? AnaraDate.ParseFromString(disbandDate) : null;
    public int? DisbandAgeId { get; set; } = disbandAgeId; // FK Historical Ages
    public AnaraAge? DisbandAge { get; } = disbandAge;
    public List<(int id, string name)> NotableCreatedArtifacts { get; set; } = [];
    public List<(int id, string name)> NotableOwnedArtifacts { get; set; } = [];
    public List<(int id, string name)> NotableEvents { get; set; } = [];
    public List<(int id, string name)> NotableLocations { get; set; } = [];
    public List<(int id, string name)> NotableNPCs { get; set; } = [];
}
