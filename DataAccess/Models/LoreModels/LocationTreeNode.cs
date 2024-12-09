using System.Text;

namespace DataAccess.Models.LoreModels;

/// <summary>
/// Represents a node of the location tree.
/// </summary>
/// <param name="location">location model the node represents</param>
/// <param name="depth">depth of the node based on number of containing locations</param>
public class LocationTreeNode(LocationModel location, uint depth)
{
    public int LocationId { get; set; } = location.Id;
    public string Name { get; set; } = location.Name;

    public int? ContainingLocationId { get; set; } = location.ContainingLocationId;

    public uint Depth { get; set; } = depth;
    public bool HasSubLocations { get; set; } = location.HasSubLocations;


    /// <summary>
    /// Returns a string of the location node. Depth is added as left padded spaces.
    /// </summary>
    /// <returns>String representation of the node</returns>
    public override string ToString()
    {
        StringBuilder stringBuilder = new();
        for (int i = 0; i < Depth; i++)
        {
            stringBuilder.Append("  ");
        }
        stringBuilder.Append($"{Name}");
        return stringBuilder.ToString();
    }

    /// <summary>
    /// Used to get a string for writing in the terminal.
    /// </summary>
    /// <returns>string formated for the terminal</returns>
    public string ToTerminalString()
    {
        StringBuilder stringBuilder = new();
        for (int i = 0; i < Depth; i++)
        {
            stringBuilder.Append("  ");
        }
        stringBuilder.Append($"{Name}");
        if (HasSubLocations)
        {
            stringBuilder.Append(" >");
        }
        return stringBuilder.ToString();
    }
}
