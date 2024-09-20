using System.Text;

namespace AnaraScapeTools.Commands;

/// <summary>
/// Prints all CLI commands to the console.
/// </summary>
public class Help : IToolCommand
{
    public void Job()
    {
        StringBuilder builder = new();
        builder.AppendLine("\nList of Available Commands:\n\n");
        builder.AppendLine("help - shows all commands available\n\n");
        builder.AppendLine("EXIT - exits this application\n\n");
        builder.AppendLine("load-tiles - loads all tiles in the staging folder to the database\n\n");
        builder.AppendLine("resize-tiles - resizes all tiles to the given scale (0.1 - 0.9)\n\n");
        builder.AppendLine("design-maps - designs a requested amount of maps according to parameters\n\n");
        builder.AppendLine("get-logs - gets logs from the database based on parameters\n\n");
        builder.AppendLine("lore-submenu - insert lore in chosen table\n\n");
        builder.AppendLine("update-sublocation-flags - updates all sublocation flags in the Locations table\n\n");
        builder.AppendLine("DELETE-ALL-tiles - DELETES ALL tiles from the database: ALL TILES WILL BE DELETED!\n\n");

        Console.WriteLine(builder.ToString());
    }
}
