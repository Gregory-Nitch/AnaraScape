namespace DataAccess.Models.LoreModels;

/// <summary>
/// Represents an event in the game setting.
/// </summary>
/// <param name="storedModel">stored model from database</param>
public class EventModel(StoredEventModel storedModel)
{
    public int Id { get; set; } = storedModel.Id;
    public string Name { get; set; } = storedModel.Name;
    public bool IsMultiDayEvent { get; set; } = storedModel.IsMultiDayEvent;
    public string? Description { get; set; } = storedModel?.Description;
    public AnaraDate? StartDate { get; set; } = storedModel?.StartDate != null ? 
                                                AnaraDate.ParseFromString(storedModel.StartDate)
                                                : null;
    public int? StartAgeId { get; set; } = storedModel?.StartAgeId; // FK (HistoricalAges)
    public AnaraDate? EndDate { get; set; } = storedModel?.EndDate != null ? 
                                              AnaraDate.ParseFromString(storedModel.EndDate) : null;
    public int? EndAgeId { get; set; } = storedModel?.EndAgeId; // FK (HistoricalAges)
}


/// <summary>
/// Stored event model holds dates as strings.
/// </summary>
/// <param name="id">id from db</param>
/// <param name="name">name of event</param>
/// <param name="isMultiDayEvent">denotes if the event lasted for more than one day</param>
/// <param name="description">description of event</param>
/// <param name="startDate">start date in string form</param>
/// <param name="startAgeId">start age id FK(HistoricalAges)</param>
/// <param name="endDate">end date in string form</param>
/// <param name="endAgeId">end age id FK(HistoricalAges)</param>
public class StoredEventModel(int id,
                        string name,
                        bool isMultiDayEvent,
                        string? description,
                        string? startDate,
                        int? startAgeId,
                        string? endDate,
                        int? endAgeId)
{
    public int Id { get; set; } = id;
    public string Name { get; set; } = name ?? throw new ArgumentNullException(nameof(name));
    public bool IsMultiDayEvent { get; set; } = isMultiDayEvent;
    public string? Description { get; set; } = description;
    public string? StartDate { get; set; } = startDate;
    public int? StartAgeId { get; set; } = startAgeId; // FK (HistoricalAges)
    public string? EndDate { get; set; } = endDate;
    public int? EndAgeId { get; set; } = endAgeId; // FK (HistoricalAges)
}


/// <summary>
/// Represents a event model to load into the database after being built (such as CLI tool)
/// </summary>
/// <param name="name">name of event</param>
/// <param name="isMultiDayEvent">denote if the event lasted for more than one day</param>
/// <param name="description">description of event</param>
/// <param name="startDate">start date of the event</param>
/// <param name="startAgeId">start age id FK(HistoricalAges)</param>
/// <param name="endDate">end date of the event</param>
/// <param name="endAgeId">end age id FK(HistoricalAges)</param>
public class LoadingEventModel(string name, bool isMultiDayEvent)
{
    public string Name { get; set; } = name ?? throw new ArgumentNullException(nameof(name));
    public bool IsMultiDayEvent { get; set; } = isMultiDayEvent;
    public string? Description { get; set; }
    public string? StartDate { get; set; }
    public int? StartAgeId { get; set; } // FK (HistoricalAges)
    public string? EndDate { get; set; }
    public int? EndAgeId { get; set; } // FK (HistoricalAges)
}
