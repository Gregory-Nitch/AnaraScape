

using System.Text;

/**
 * Help command for the tool, prints out to the console
 */
namespace AnaraScapeTools.Commands;

public class Help : IToolCommand
{
    public void Job()
    {

        StringBuilder builder = new();
        builder.AppendLine("\nList of Available Commands:\n\n");
        builder.AppendLine("help - shows all commands available\n\n");
        builder.AppendLine("EXIT - exits this application\n\n");
        builder.AppendLine("load-tiles - loads all tiles in the staging folder to the database\n\n");
        builder.AppendLine("design-maps - designs a requested amount of maps according to parameters\n\n");
        builder.AppendLine("DELETE-ALL-tiles - DELETES ALL tiles from the database: ALL TILES WILL BE DELETED!\n\n");

        Console.WriteLine(builder.ToString());
    }
}
