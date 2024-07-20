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
    public int? LeaderId { get; set; } = storedModel.LeaderId;
    public AnaraDate? FoundingDate { get; set; } = 
        storedModel.FoundingDate != null ? AnaraDate.ParseFromString(storedModel.FoundingDate) : null;
    public int? FoundingAgeId { get; set; } = storedModel.FoundingAgeId;
    public AnaraDate? DisbandDate { get; set; } =
        storedModel.DisbandDate != null ? AnaraDate.ParseFromString(storedModel.DisbandDate) : null;
    public int? DisbandAgeId { get; set; } = storedModel.DisbandAgeId;
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
    public int? LeaderId { get; set; } = leaderId;
    public string? FoundingDate { get; set; } = foundingDate;
    public int? FoundingAgeId { get; set; } = foundingAgeId;
    public string? DisbandDate { get; set; } = disbandDate;
    public int? DisbandAgeId { get; set; } = disbandAgeId;
}


/// <summary>
/// Model as it is being built for entry into database (such as CLI tool)
/// </summary>
/// <param name="name">name of faction</param>
public class LoadingFactionModel(string name)
{
    public string Name { get; set; } = name ?? throw new ArgumentNullException(nameof(name));
    public string? Description { get; set; }
    public int? LeaderId { get; set; }
    public AnaraDate? FoundingDate { get; set; }
    public int? FoundingAgeId { get; set; }
    public AnaraDate? DisbandDate { get; set; }
    public int? DisbandAgeId { get; set; }
}
