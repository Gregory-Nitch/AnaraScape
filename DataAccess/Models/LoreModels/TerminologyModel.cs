namespace DataAccess.Models.LoreModels;

public class TerminologyModel(StoredTerminologyModel storedModel)
{
    public int Id { get; set; } = storedModel.Id;
    public string Term { get; set; } = storedModel.Term;
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
/// <param name="term">term to be defined</param>
/// <param name="definition">definition of the term</param>
/// <param name="inventorId">id of the inventor FK(NPCs)</param>
/// <param name="inventionDate">invention date of the term in string form</param>
/// <param name="inventionAgeId">id of the invention age FK(HistoricalAges)</param>
public class StoredTerminologyModel(int id,
                                    string term,
                                    string? definition,
                                    int? inventorId,
                                    string? inventionDate,
                                    int? inventionAgeId)
{
    public int Id { get; set; } = id;
    public string Term { get; set; } = term ?? throw new ArgumentNullException(nameof(term));
    public string? Definition { get; set; } = definition;
    public int? InventorId { get; set; } = inventorId; // FK (NPCs)
    public string? InventionDate { get; set; } = inventionDate;
    public int? InventionAgeId { get; set; } = inventionAgeId; // FK (HistoricalAges)
}

public class LoadingTerminologyModel(string term)
{
    public string Term { get; set; } = term;
    public string? Definition { get; set; }
    public int? InventorId { get; set; } // FK (NPCs)
    public AnaraDate? InventionDate { get; set; }
    public int? InventionAgeId { get; set; } // FK (HistoricalAges)
}
