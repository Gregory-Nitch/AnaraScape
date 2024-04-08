/**
 * CLI tool to perform various jobs for the website, such as loading dungeon tiles.
 */

using AnaraScapeTools;

internal class Program
{



    private static void Main(string[] args)
    {
        CommandRegister register = new();

        string? cmd = "";
        Console.WriteLine("Entering AnaraScape Tooling: Enter 'EXIT' to exit program...");
        while (cmd != "EXIT")
        {
            Console.Write("||> ");
            cmd = Console.ReadLine();
            Console.WriteLine();

            switch (cmd)
            {
                case "":
                // Fall through...
                case "help":
                    register.Commands["help"].Job();
                    Console.WriteLine("\nReturned to main...");
                    break;

                case "loadtiles":
                    register.Commands[cmd].Job();
                    Console.WriteLine("\nReturned to main...");
                    break;

                case "EXIT":
                    Console.WriteLine("Exiting...");
                    break;

                default:
                    Console.WriteLine("Invalid Command...\n");
                    break;
            }
        }
    }
}
