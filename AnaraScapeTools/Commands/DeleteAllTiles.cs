using DataAccess;

namespace AnaraScapeTools.Commands;

/// <summary>
/// DELETEs ALL tiles from the database.
/// </summary>
/// <param name="crud">CRUD object to execute sql</param>
public class DeleteAllTiles(ICrud crud) : IToolCommand
{

    private readonly ICrud _crud = crud;

    public void Job()
    {
        _crud.DeleteAllTiles();
        Console.WriteLine("\n\n--- DELETED ALL tiles from DB! ---");
    }
}
