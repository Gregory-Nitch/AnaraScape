namespace DataAccess.Models.LoreModels;

/// <summary>
/// Represents a resource in the game setting.
/// </summary>
/// <param name="id">id from db</param>
/// <param name="name">name of resource</param>
/// <param name="description">description of resource</param>
/// <param name="rarity">rarity enum</param>
public class ResourceModel(int id, string name, string? description, ResourceRarity? rarity)
{
    public int Id { get; set; } = id;
    public string Name { get; set; } = name ?? throw new ArgumentNullException(nameof(name));
    public string? Description { get; set; } = description;
    public ResourceRarity? Rarity { get; set; } = rarity;
}

/// <summary>
/// Represents a level of rarity in the game setting.
/// </summary>
public enum ResourceRarity
{
    Abundant,
    Common,
    Uncommon,
    Rare,
    Scarce,
    Ledgendary
}
