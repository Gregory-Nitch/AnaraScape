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


/// <summary>
/// Represents a historical age in the setting, includes all of its relationships.
/// </summary>
/// <param name="id">id from db</param>
/// <param name="age">age of the historical age (enum)</param>
/// <param name="description">description of the age</param>
/// <param name="lengthInYears">lenght of the age in years</param>
public class FullHistoricalAgeModel(int id,
                                    AnaraAge age,
                                    string description,
                                    int? lengthInYears,
                                    AnaraAge? precedingAge,
                                    int? precedingAgeId,
                                    AnaraAge? followingAge,
                                    int? followingAgeId)
{
    public int Id { get; set; } = id;
    public AnaraAge Age { get; set; } = age;
    public string Description { get; set; } = description;
    public int? LengthInYears { get; set; } = lengthInYears;
    public AnaraAge? PrecedingAge { get; } = precedingAge;
    public int? PrecedingAgeId { get; } = precedingAgeId;
    public AnaraAge? FollowingAge { get; } = followingAge;
    public int? FollowingAgeId { get; } = followingAgeId;
    public List<(int id, string name)> NotableLivingNPCs { get; set; } = [];
    public List<(int id, string name)> NotableDeadNPCs { get; set; } = [];
    public List<(int id, string name)> NotableCreatedArtifacts { get; set; } = [];
    public List<(int id, string name)> NotableLostArtifacts { get; set; } = [];
    public List<(int id, string name)> NotableBeginingEvents { get; set; } = [];
    public List<(int id, string name)> NotableEndingEvents { get; set; } = [];
    public List<(int id, string name)> NotableFoundingFactions { get; set; } = [];
    public List<(int id, string name)> NotableDisbandingFactions { get; set; } = [];
}
