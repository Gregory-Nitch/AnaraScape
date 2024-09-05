CREATE PROCEDURE [Lore].[spArtifacts_GetFullInfoById]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Artifacts].[Id],
    [Artifacts].[Name],
    [Artifacts].[Description],
    [LocationId],
    [Locations].[Name] AS [LocationName],
    [OwnerType],
    [NPCOwnerId],
    (SELECT TOP 1
      [Name]
    FROM [Lore].[NPCs]
    WHERE [NPCs].[Id] = [Artifacts].[NPCOwnerId]) AS [NPCOwnerName],
    [FactionOwnerId],
    (SELECT TOP 1
      [Name]
    FROM [Lore].[Factions]
    WHERE [Factions].[Id] = [Artifacts].[FactionOwnerId]) AS [FactionOwnerName],
    [CreatorType],
    [NPCCreatorId],
    (SELECT TOP 1
      [Name]
    FROM [Lore].[NPCs]
    WHERE [NPCs].[Id] = [Artifacts].[NPCCreatorId]) AS [NPCCreatorName],
    [FactionCreatorId],
    (SELECT TOP 1
      [Name]
    FROM [Lore].[Factions]
    WHERE [Factions].[Id] = [Artifacts].[FactionCreatorId]) AS [FactionCreatorName],
    [CreationDate],
    [CreationAgeId],
    (SELECT TOP 1
      [Age]
    FROM [Lore].[HistoricalAges]
    WHERE [HistoricalAges].[Id] = [Artifacts].[CreationAgeId]) AS [CreationAge],
    [LostDate],
    [LostAgeId],
    (SELECT TOP 1
      [Age]
    FROM [Lore].[HistoricalAges]
    WHERE [HistoricalAges].[Id] = [Artifacts].[LostAgeId]) AS [LostAge]
  FROM [Lore].[Artifacts]
    FULL JOIN [Lore].[Locations] ON
  ([Locations].[Id] = [LocationId])
  WHERE [Artifacts] .[Id] = @Id;

END
