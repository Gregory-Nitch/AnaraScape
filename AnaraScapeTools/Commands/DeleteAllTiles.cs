﻿
/**
 * This command DELETES ALL tiles from the database
 */

using DataAccess;

namespace AnaraScapeTools.Commands;

public class DeleteAllTiles(ICrud crud) : IToolCommand
{

    private readonly ICrud _crud = crud;

    public void Job()
    {
        _crud.DeleteAllTiles();
        Console.WriteLine("\n\n--- DELETED ALL tiles from DB! ---");
    }
}
