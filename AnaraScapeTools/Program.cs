﻿/**
 * CLI tool to perform various jobs for the website, such as loading dungeon tiles.
 */

using AnaraScapeTools.Commands;
using DataAccess;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

internal class Program
{
    public static ServiceProvider? ServiceProvider;

    private static void StartConfig()
    {
        var services = new ServiceCollection();
        services.AddTransient<IDBAccess, DBAccess>();
        services.AddTransient<ICrud, Crud>();

        var builder = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json");

        IConfiguration config = builder.Build();
        services.AddSingleton(config);
        ServiceProvider = services.BuildServiceProvider();
    }

    private static void Main(string[] args)
    {
        StartConfig();

        string? cmd = "";
        Console.WriteLine("Entering AnaraScape Tooling: Enter 'EXIT' to exit program...");
        while (cmd != "EXIT")
        {
            Console.Write("||> ");
            cmd = Console.ReadLine();
            Console.WriteLine();
            var crud = ServiceProvider!.GetService<ICrud>()!;

            switch (cmd)
            {
                case "":
                // Fall through...
                case "help":
                    Help help = new();
                    help.Job();
                    Console.WriteLine("\nReturned to main...");
                    break;

                case "load-tiles":
                    LoadTiles loadTiles = new(crud);
                    loadTiles.Job();
                    Console.WriteLine("\nReturned to main...");
                    break;

                case "resize-tiles":
                    ResizeTiles resizeTiles = new();
                    resizeTiles.Job();
                    Console.WriteLine("\nReturned to main...");
                    break;

                case "design-maps":
                    DesignMaps designMaps = new(crud);
                    designMaps.Job();
                    Console.WriteLine("\nReturned to main...");
                    break;

                case "DELETE-ALL-tiles":
                    DeleteAllTiles deleteTiles = new(crud);
                    deleteTiles.Job();
                    Console.WriteLine("\nReturned to main...");
                    break;

                case "EXIT":
                    Console.WriteLine("Exiting...");
                    break;

                default:
                    Console.WriteLine("Command not found, try 'help' for a list of commands...\n");
                    break;
            }
        }
    }
}
