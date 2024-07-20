namespace DataAccess.Models.LoreModels;

public struct AnaraDate(int year, int month, int day)
{
    public int Year { get; set; } = year;
    public int Month { get; set; } = month;
    public int Day { get; set; } = day;

    public override readonly string ToString()
    {
        return $"{Year}-{Month}-{Day}";
    }

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
    Precreation,
    Primordial,
    Mythic,
    Schism,
    Dark,
    AfterDark,
}
