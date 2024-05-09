


using DataAccess;
using DataAccess.Models;
using MapDesignLibrary;


namespace AnaraScapeTools.Commands;

/// <summary>
/// Command to call the map designer from the MapDesigner Class library for testing.
/// Has optional parameters for number of generations and map traits
/// </summary>
/// <param name="crud">ICrud interface used to call stored procedures on the database</param>
public class DesignMaps(ICrud crud) : IToolCommand
{
    private readonly ICrud _crud = crud;

    private Dictionary<string, string> MapTraits = [];

    private void GetTraits()
    {
        Console.WriteLine("\nPlease enter the height, width, style, level, and stairs " +
            "value for the requested map separated by commas or hit enter for the default" +
            "(same as below example.)\n\tSyntax: height,width,style,level,needsStairs,quantity" +
            " | Example: 3,3,fort,top,true,3");

        Console.Write("||> ");
        string? traitString = Console.ReadLine();

        if (string.IsNullOrWhiteSpace(traitString))
        {
            MapTraits["height"] = "3";
            MapTraits["width"] = "3";
            MapTraits["style"] = "fort";
            MapTraits["level"] = "top";
            MapTraits["needsStairs"] = "true";
            MapTraits["quantity"] = "1";
            return;
        }

        string[] traitArray = traitString.Split(',');

        MapTraits["height"] = traitArray[0];
        MapTraits["width"] = traitArray[1];
        MapTraits["style"] = traitArray[2];
        MapTraits["level"] = traitArray[3];
        MapTraits["needsStairs"] = traitArray[4];
        MapTraits["quantity"] = traitArray[5];
    }

    public void Job()
    {
        GetTraits();

        bool hasError = false;

        if (!int.TryParse(MapTraits["height"], out int height))
        {
            Console.WriteLine("Error: invalid height entry...");
            hasError = true;
        }
        else if (height < 2 || height > 20)
        {
            Console.WriteLine("Error: height request out of range(2-20)...");
            hasError = true;
        }

        if (!int.TryParse(MapTraits["width"], out int width))
        {
            Console.WriteLine("Error: invalid width entry...");
            hasError = true;
        }
        else if (width < 2 || width > 20)
        {
            Console.WriteLine("Error: width request out of range(2-20)...");
            hasError = true;
        }

        if (!int.TryParse(MapTraits["quantity"], out int quantity))
        {
            Console.WriteLine("Error: invalid quantity request...");
            hasError = true;
        }
        else if (quantity < 1)
        {
            Console.WriteLine("Error: quantity request must exceed 1...");
        }

        if (!bool.TryParse(MapTraits["needsStairs"], out bool needsStairs))
        {
            Console.WriteLine("Error: invalid needs stairs entry...");
            hasError = true;
        }

        if (hasError)
        {
            Console.WriteLine("Command failure, aborting...\n");
            return;
        }

        List<StoredDungeonTileModel> storedTiles = [.. _crud.GetAllTiles()];

        List<DungeonTileModel> tiles = [];
        foreach (var tile in storedTiles)
        {
            tiles.Add(new DungeonTileModel(tile));
        }

        Console.WriteLine("\nBeginning map generation...");

        for (int i = 0; i < quantity; i++)
        {
            MapDesign design = new(height,
                                   width,
                                   MapTraits["style"],
                                   MapTraits["level"],
                                   needsStairs,
                                   tiles);

            design.Generate();

            Console.WriteLine($"\nMap Number = {i + 1}");
            Console.WriteLine(design.ToString());
            Console.WriteLine();
        }
    }
}
