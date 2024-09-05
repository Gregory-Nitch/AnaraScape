CREATE PROCEDURE [Lore].[spEvents_GetFullInfoById]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name],
    [IsMultiDayEvent],
    [Description],
    [StartDate],
    [StartAgeId],
    (SELECT TOP 1
      [Age]
    FROM [Lore].[HistoricalAges]
    WHERE [Id] = [StartAgeId]) AS [StartAge],
    [EndDate],
    [EndAgeId],
    (SELECT TOP 1
      [Age]
    FROM [Lore].[HistoricalAges]
    WHERE [Id] = [EndAgeId]) AS [EndAge]
  FROM [Lore].[Events]
  WHERE [Id] = @Id;

END
