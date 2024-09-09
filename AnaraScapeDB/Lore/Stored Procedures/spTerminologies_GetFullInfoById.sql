CREATE PROCEDURE [Lore].[spTerminologies_GetFullInfoById]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Terminologies].[Id],
    [Terminologies].[Name],
    [Definition],
    [InventorId],
    [NPCs].[Name] AS [InventorName],
    [InventionDate],
    [InventionAgeId],
    [HistoricalAges].[Age] AS [InventionAge]
  FROM [Lore].[Terminologies]
    FULL JOIN [Lore].[NPCs] ON ([NPCs].[Id] = [InventorId])
    FULL JOIN [Lore].[HistoricalAges] ON ([HistoricalAges].[Id] = [InventionAgeId])
  WHERE [Terminologies].[Id] = @Id;

END
