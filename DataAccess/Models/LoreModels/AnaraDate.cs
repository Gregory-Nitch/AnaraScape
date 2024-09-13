namespace DataAccess.Models.LoreModels;

/// <summary>
/// Struct to represent a date in the setting's history
/// </summary>
/// <param name="year"></param>
/// <param name="month"></param>
/// <param name="day"></param>
public struct AnaraDate(int year, int month, int day)
{
    public int Year { get; set; } = year;
    public int Month { get; set; } = month;
    public int Day { get; set; } = day;

    /// <summary>
    /// Gets the date as a string.
    /// </summary>
    /// <returns>string in the form YYYY-MM-DD</returns>
    public override readonly string ToString()
    {
        return $"{Year}-{Month}-{Day}";
    }

    /// <summary>
    /// Parses an AnaraDate object from a passed string.
    /// </summary>
    /// <param name="str">string to parse</param>
    /// <returns>AnaraDate object represented by passed string</returns>
    public static AnaraDate ParseFromString(string str)
    {
        string[] vals = str.Split('-');
        return new AnaraDate(int.Parse(vals[0]), int.Parse(vals[1]), int.Parse(vals[2]));
    }
}


/// <summary>
/// Chronological order of Anara's ages as an enum
/// </summary>
public enum AnaraAge
{
    REQUIRED = -1, // Used for LoreFactory object building
    Precreation,
    Primordial,
    Mythic,
    Schism,
    Dark,
    AfterDark,
}
