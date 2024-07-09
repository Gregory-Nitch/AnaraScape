using DataAccess;
using DataAccess.Models;
using Library59.ImageProcessing;
using MapDesignLibrary;

namespace AnaraScapeTools.Commands;

/// <summary>
/// Command to call the map designer from the MapDesigner Class library for testing.
/// Has optional parameters for number of generations, map traits and save requests
/// </summary>
/// <param name="crud">CRUD object to execute sql</param>
public class DesignMaps(ICrud crud) : IToolCommand
{
    private readonly ICrud _crud = crud;
    private readonly int TILE_SIZE = 512;

    private Dictionary<string, string> RequestOptions = [];

    private void GetCommandOptions()
    {
        Console.WriteLine("\nPlease enter the height, width, style, level, and stairs " +
            "value for the requested map separated by commas or hit enter for the default" +
            "(same as below example.)\n\tSyntax: height,width,style,level,needsStairs,quantity" +
            ",saveDesigns | Example: 3,3,fort,top,true,3,false");

        Console.Write("||> ");
        string? requestString = Console.ReadLine();

        if (string.IsNullOrWhiteSpace(requestString))
        {
            RequestOptions["height"] = "3";
            RequestOptions["width"] = "3";
            RequestOptions["style"] = "fort";
            RequestOptions["level"] = "top";
            RequestOptions["needsStairs"] = "true";
            RequestOptions["quantity"] = "3";
            RequestOptions["saveDesigns"] = "false";
            return;
        }

        string[] requestArray = requestString.Split(',');

        RequestOptions["height"] = requestArray[0];
        RequestOptions["width"] = requestArray[1];
        RequestOptions["style"] = requestArray[2];
        RequestOptions["level"] = requestArray[3];
        RequestOptions["needsStairs"] = requestArray[4];
        RequestOptions["quantity"] = requestArray[5];
        RequestOptions["saveDesigns"] = requestArray[6];
    }

    public void Job()
    {
        GetCommandOptions();

        bool hasError = false;

        if (!int.TryParse(RequestOptions["height"], out int height))
        {
            Console.WriteLine("Error: invalid height entry...");
            hasError = true;
        }
        else if (height < 2 || height > 20)
        {
            Console.WriteLine("Error: height request out of range(2-20)...");
            hasError = true;
        }

        if (!int.TryParse(RequestOptions["width"], out int width))
        {
            Console.WriteLine("Error: invalid width entry...");
            hasError = true;
        }
        else if (width < 2 || width > 20)
        {
            Console.WriteLine("Error: width request out of range(2-20)...");
            hasError = true;
        }

        if (!int.TryParse(RequestOptions["quantity"], out int quantity))
        {
            Console.WriteLine("Error: invalid quantity request...");
            hasError = true;
        }
        else if (quantity < 1)
        {
            Console.WriteLine("Error: quantity request must exceed 1...");
        }

        if (!bool.TryParse(RequestOptions["needsStairs"], out bool needsStairs))
        {
            Console.WriteLine("Error: invalid needs stairs entry...");
            hasError = true;
        }

        if (!bool.TryParse(RequestOptions["saveDesigns"], out bool requestedSave))
        {
            Console.WriteLine("Error: invalid save request entry...");
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

        MapDesigner designer = new(height,
                               width,
                               RequestOptions["style"],
                               RequestOptions["level"],
                               needsStairs,
                               tiles);

        for (int i = 0; i < quantity; i++)
        {
            MapDesign design = designer.Generate();
            Console.WriteLine($"\nMap Number = {i + 1}");
            Console.WriteLine(design.ToString());
            Console.WriteLine();

            if (requestedSave)
            {
                string outPath = $"./TestMaps/TestMapNum{i + 1}.png";
                string tilesDir = "./TileStaging/";
                Task.Run(() =>
                {
                    List<List<string>> filesToMerge = [];
                    foreach (var idRow in design.DisplayMatrix)
                    {
                        List<string> fileRow = [];
                        foreach (var id in idRow)
                        {
                            fileRow.Add(design.ImageMap[id]);
                        }
                        filesToMerge.Add(fileRow);
                    }

                    JpegMerger.MergeFrom2DListAndSaveToPng(filesToMerge,
                                                      tilesDir,
                                                      TILE_SIZE,
                                                      TILE_SIZE,
                                                      outPath);
                    return;
                });
            }
        }
    }
}
