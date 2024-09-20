using AnaraScapeTools.Commands;
using DataAccess;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

/// <summary>
/// CLI tool for backend management of AnaraScape
/// </summary>
internal class Program
{
    public static ServiceProvider? ServiceProvider;

    private static readonly string _returnedToMainMsg = "\nReturned to main...";

    /// <summary>
    /// Gets database config from settings file.
    /// </summary>
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

    private static void Main()
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
                    Console.WriteLine(_returnedToMainMsg);
                    break;

                case "load-tiles":
                    LoadTiles loadTiles = new(crud);
                    loadTiles.Job();
                    Console.WriteLine(_returnedToMainMsg);
                    break;

                case "resize-tiles":
                    ResizeTiles resizeTiles = new();
                    resizeTiles.Job();
                    Console.WriteLine(_returnedToMainMsg);
                    break;

                case "design-maps":
                    DesignMaps designMaps = new(crud);
                    designMaps.Job();
                    Console.WriteLine(_returnedToMainMsg);
                    break;

                case "get-logs":
                    GetLogs getLogs = new(crud);
                    getLogs.Job();
                    Console.WriteLine(_returnedToMainMsg);
                    break;

                case "lore-submenu":
                    LoreSubMenu loreSubMenu = new(crud);
                    loreSubMenu.Job();
                    Console.WriteLine(_returnedToMainMsg);
                    break;

                case "update-sublocation-flags":
                    UpdateAllLocationSublocationFlags sublocUpdater = new(crud);
                    sublocUpdater.Job();
                    Console.WriteLine(_returnedToMainMsg);
                    break;

                case "DELETE-ALL-tiles":
                    DeleteAllTiles deleteTiles = new(crud);
                    deleteTiles.Job();
                    Console.WriteLine(_returnedToMainMsg);
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
