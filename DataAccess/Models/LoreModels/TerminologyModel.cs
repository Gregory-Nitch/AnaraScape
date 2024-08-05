namespace DataAccess.Models.LoreModels;


/// <summary>
/// Represents a term in the game setting.
/// </summary>
/// <param name="storedModel">model from db to build full model from</param>
public class TerminologyModel(StoredTerminologyModel storedModel)
{
    public int Id { get; set; } = storedModel.Id;
    public string Name { get; set; } = storedModel.Name;
    public string? Definition { get; set; } = storedModel?.Definition;
    public int? InventorId { get; set; } = storedModel?.InventorId; // FK (NPCs)
    public AnaraDate? InventionDate { get; set; } = storedModel?.InventionDate != null ? 
                                                    AnaraDate.ParseFromString(storedModel.InventionDate)
                                                    : null;
    public int? InventionAgeId { get; set; } = storedModel?.InventionAgeId; // FK (HistoricalAges)
}


/// <summary>
/// Represents a term as it is stored in the database
/// </summary>
/// <param name="id">id from db</param>
/// <param name="name">term to be defined</param>
/// <param name="definition">definition of the term</param>
/// <param name="inventorId">id of the inventor FK(NPCs)</param>
/// <param name="inventionDate">invention date of the term in string form</param>
/// <param name="inventionAgeId">id of the invention age FK(HistoricalAges)</param>
public class StoredTerminologyModel(int id,
                                    string name,
                                    string? definition,
                                    int? inventorId,
                                    string? inventionDate,
                                    int? inventionAgeId)
{
    public int Id { get; set; } = id;
    public string Name { get; set; } = name ?? throw new ArgumentNullException(nameof(name));
    public string? Definition { get; set; } = definition;
    public int? InventorId { get; set; } = inventorId; // FK (NPCs)
    public string? InventionDate { get; set; } = inventionDate;
    public int? InventionAgeId { get; set; } = inventionAgeId; // FK (HistoricalAges)
}


/// <summary>
/// Represents a term as it is being loaded.
/// </summary>
/// <param name="name">name of the term</param>
public class LoadingTerminologyModel(string name)
{
    public string Name { get; set; } = name;
    public string? Definition { get; set; }
    public int? InventorId { get; set; } // FK (NPCs)
    public string? InventionDate { get; set; }
    public int? InventionAgeId { get; set; } // FK (HistoricalAges)
}
