namespace DataAccess.Models.LoreModels;

/// <summary>
/// Object to represent data shape of the locations to be shown in the lore side bar component.
/// </summary>
public class LocationTree
{
    public List<LocationTreeNode> LocationTreeNodes { get; set; } = [];

    /// <summary>
    /// Builds a Location tree from the stored location cache.
    /// </summary>
    /// <param name="locationCache">singleton location cache object</param>
    public LocationTree(LocationCache locationCache)
    {
        LocationModel SolisSphere = locationCache.Locations.Where(x => x.Name == "Solis Sphere")
            .FirstOrDefault()!;

        LocationTreeNode solisSphereNode = new(SolisSphere, 0);

        LocationTreeNodes.Add(solisSphereNode);
        LocationTreeNodes.AddRange(GetNodeSubLocations(solisSphereNode, locationCache));
    }

    /// <summary>
    /// Gets all of the passed node's sublocations and places them in the tree at the proper
    /// location. Recursively adds subnode sublocations to properly order the tree.
    /// </summary>
    /// <param name="node">node to get sublocations for</param>
    /// <param name="locationCache">singleton location cache object</param>
    /// <returns></returns>
    public static List<LocationTreeNode> GetNodeSubLocations(LocationTreeNode node, LocationCache locationCache)
    {
        List<LocationTreeNode> outList = [];
        List<LocationModel> subLocations = locationCache.Locations
                .Where(x => x.ContainingLocationId == node.LocationId)
                .ToList();

        foreach (var subLocation in subLocations)
        {
            LocationTreeNode subNode = new(subLocation, node.Depth + 1);
            outList.Add(subNode);
            outList.AddRange(GetNodeSubLocations(subNode, locationCache));
        }

        return outList;
    }
}
