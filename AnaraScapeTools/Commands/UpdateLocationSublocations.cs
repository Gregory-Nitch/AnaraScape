using DataAccess;

namespace AnaraScapeTools.Commands;

public class UpdateAllLocationSublocationFlags(ICrud crud) : IToolCommand
{
    private readonly ICrud _crud = crud;

    /// <summary>
    /// Gets all rows from the Locations table in db and sets their HasSublocations flag.
    /// </summary>
    public void Job()
    {
        Console.WriteLine("\nSetting sublocation flags...");
        int updateCount = _crud.UpdateAllSublocationFlags();
        if (updateCount > 0)
        {
            Console.WriteLine($"Flags set, count = {updateCount}");
        }
        else
        {
            Console.WriteLine("ERR: No flags were set, double check the database has data...");
        }
    }
}
