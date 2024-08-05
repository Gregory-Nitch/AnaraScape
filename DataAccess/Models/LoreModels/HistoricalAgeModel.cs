namespace DataAccess.Models.LoreModels;

/// <summary>
/// Represents a historical age in Anara's history.
/// </summary>
/// <param name="id">id from database</param>
/// <param name="age">enum representing the age's name & chronological order</param>
/// <param name="description">description text of the age</param>
/// <param name="lengthInYears">length of the age in years (nullable)</param>
public class HistoricalAgeModel(int id, AnaraAge age, string description, int? lengthInYears)
{
    public int Id { get; set; } = id;
    public AnaraAge Age { get; set; } = age;
    public string Description { get; set; } = description;
    public int? LengthInYears { get; set; } = lengthInYears;
}


/// <summary>
/// Represents a historical age in Anara's history to load into the database.
/// </summary>
/// <param name="age">enum representing the age's name & chronological order</param>
/// <param name="description">description text of the age</param>
/// <param name="lengthInYears">length of the age in years (nullable)</param>
public class LoadingHistoricalAgeModel(AnaraAge age, string description)
{
    public AnaraAge Age { get; set; } = age;
    public string Description { get; set; } = description;
    public int? LengthInYears { get; set; }
}
