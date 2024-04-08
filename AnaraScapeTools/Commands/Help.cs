/**
 * Help command for the tool, prints out to the console
 */

namespace AnaraScapeTools.Commands;

public class Help : IToolCommand
{
    public void Job()
    {
        Console.WriteLine(
            "\nList of Available Commands:\n\n" +
            "help - shows all commands available\n\n" +
            "load-tiles - loads all tiles in the staging folder to the database\n\n"
            );
    }
}
