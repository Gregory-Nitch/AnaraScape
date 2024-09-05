CREATE PROCEDURE [Lore].[spFactions_GetFullInfoById]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Factions].[Id],
    [Factions].[Name],
    [Factions].[Description],
    [LeaderId],
    [Npcs].[Name] AS [LeaderName],
    [FoundingDate],
    [FoundingAgeId],
    (SELECT TOP 1
      [Age]
    FROM [Lore].[HistoricalAges]
    WHERE [Id] = [FoundingAgeId]) AS [FoundingAge],
    [DisbandDate],
    [DisbandAgeId],
    (SELECT TOP 1
      [Age]
    FROM [Lore].[HistoricalAges]
    WHERE [Id] = [DisbandAgeId]) AS [DisbandAge]
  FROM [Lore].[Factions]
    FULL JOIN [Lore].[NPCs] ON ([NPCs].[Id] = [LeaderId])
  WHERE [Factions].[Id] = @Id;

END
