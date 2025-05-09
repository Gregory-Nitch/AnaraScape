﻿using DataAccess;
using DataAccess.Models.DungeonModels;

namespace AnaraScapeTools.Commands;

/// <summary>
/// Loads all the tiles in the 'TileStaging' directory to the database.
///                                                 string[conn]
///                                                v    v    v   v
/// Required file nameing convention: Name^style^conn,conn,conn,conn^isEntrance^isStairs
/// </summary>
/// <param name="crud">CRUD object to execute sql</param>
public class LoadTiles(ICrud crud) : IToolCommand
{
    private readonly ICrud _crud = crud;

    public void Job()
    {
        string[] images = Directory.GetFileSystemEntries("./TileStaging"); // In exe directory
        List<LoadingDungeonTileModel> tiles = [];
        List<string> failures = [];

        for (int i = 0; i < images.Length; i++)
        {// Directory path and filetype ext. cause problems -> replace with empty string
            images[i] = images[i].Replace("./TileStaging", "")
                .Replace(".jpg", "");
        }

        foreach (string image in images)
        {
            string[] imageData = image.Split('^');
            string name = imageData[0];
            string style = imageData[1];
            List<string> connections = [.. imageData[2].Split(',')];
            string isEntranceText = imageData[3];
            string isStairs = imageData[4];

            // Validate|sanitize data before entering to database
            style = style.ToLower();

            connections.Sort();
            bool connectionsFailed = false;
            foreach (var c in connections)
            {
                if (c.Length > 2)
                {
                    connectionsFailed = true;
                    break;
                }
            }
            if (connectionsFailed)
            {
                failures.Add(image);
                continue;
            }

            if (!bool.TryParse(isEntranceText, out bool isEntrance))
            {
                failures.Add(image);
                continue;
            }

            isStairs = isStairs.ToLower();
            if (isStairs != "up" && isStairs != "down" && isStairs != "false")
            {
                failures.Add(image);
                continue;
            }

            LoadingDungeonTileModel tile = new(
                name,
                style,
                string.Join(',', connections),
                isEntrance,
                isStairs,
                image + ".jpg" // Filename readded ext for file saving
                );

            tiles.Add(tile);
        }

        Console.WriteLine($"\n\n--- Added Tiles = {tiles.Count} ---");
        foreach (var tile in tiles)
        {
            Console.WriteLine($"{tile.Filename}");
            _crud.InsertTile(tile);
        }

        if (failures.Count > 0)
        {
            Console.WriteLine($"--- FAILURES = {failures.Count} ---");
            foreach (var image in failures)
            {
                Console.WriteLine(image);
            }
        }
    }
}
