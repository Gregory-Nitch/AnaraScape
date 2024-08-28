CREATE PROCEDURE [Lore].[spLocations_GetFullInfoById]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Locations].[Id],
    [Locations].[Name],
    [Locations].[Description],
    [Locations].[RulingGovernmentId],
    [Locations].[RulerId],
    [Locations].[ContainingLocationId],
    [Factions].[Name] AS [RulingGovernmentName],
    [NPCs].[Name] AS [RulerName],
    [ContainingLoc].[Name] AS [ContainingLocationName],
    [GeoMaps].[Filename] AS [MapFilename],
    [GeoMaps].[Name] AS [MapName]
  FROM [Lore].[Locations]
    FULL JOIN [Lore].[Factions] ON ([Factions].[Id] = [RulingGovernmentId])
    FULL JOIN [Lore].[NPCs] ON ([NPCs].[Id] = [RulerId])
    FULL JOIN [Lore].[GeoMaps] ON ([GeoMaps].[LocationId] = [Locations].[Id])
    FULL JOIN [Lore].[Locations] AS ContainingLoc ON 
      ([ContainingLoc].[Id] = [Locations].[ContainingLocationId])
  WHERE [Locations].[Id] = @Id;

END
