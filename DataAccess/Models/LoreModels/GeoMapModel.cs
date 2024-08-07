﻿namespace DataAccess.Models.LoreModels;


/// <summary>
/// Represents a geographical map in the game setting.
/// </summary>
/// <param name="id">id of the map (generated by db)</param>
/// <param name="name">name of the map</param>
/// <param name="locationId">location id FK(Locations)</param>
/// <param name="filename">filename of the image (not full path)</param>
public class GeoMapModel(int id, string name, int locationId, string filename)
{
    public int Id { get; set; } = id;
    public string Name { get; set; } = name ?? throw new ArgumentNullException(nameof(name));
    public int LocationId { get; set; } = locationId; // FK (Locations)
    // Name of image file (not full path
    public string Filename { get; set; } = filename ?? 
        throw new ArgumentNullException(nameof(filename));
}


/// <summary>
/// Represents a geographical map as it is being loaded (such as with CLI tool)
/// </summary>
/// <param name="name">name of the map</param>
/// <param name="locationId">location id FK(Locations)</param>
/// <param name="filename">filename of the image (not full path)</param>
public class LoadingGeoMapModel(string name, int locationId, string filename)
{
    public string Name { get; set; } = name ?? throw new ArgumentException(nameof(name));
    public int LocationId { get; set; } = locationId; // FK (Locations)
    // Name of image file (not full path)
    public string Filename { get; set; } = filename ?? 
        throw new ArgumentNullException(nameof(filename));
}
