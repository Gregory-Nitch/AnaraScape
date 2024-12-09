using System.Text;
using DataAccess;
using DataAccess.Models.LoreModels;

namespace AnaraScapeTools.Commands;

/// <summary>
/// Command to print the location node tree for debugging.
/// </summary>
/// <param name="crud">object for querying the database</param>
public class PrintLocationTree(ICrud crud) : IToolCommand
{
    private readonly ICrud _crud = crud;

    public void Job()
    {
        LocationCache locationCache = new(_crud);
        LocationTree locationTree = new(locationCache);
        StringBuilder stringBuilder = new();

        foreach (LocationTreeNode location in locationTree.LocationTreeNodes)
        {
            stringBuilder.AppendLine(location.ToTerminalString());
        }

        if (locationTree.LocationTreeNodes.Count != locationCache.Locations.Count)
        {
            stringBuilder.AppendLine(
                $"ERR: Location tree nodes count ({locationTree.LocationTreeNodes.Count}) != " +
                $"location cache location count ({locationCache.Locations.Count})...");
            stringBuilder.AppendLine("Missing locations:");
            foreach (LocationModel location in locationCache.Locations)
            {
                if (!locationTree.LocationTreeNodes.Any(node => node.Name == location.Name))
                {
                    stringBuilder.AppendLine($"\t{location.Name}");
                }
            }
        }
        Console.WriteLine(stringBuilder.ToString());
    }
}
