CREATE PROCEDURE [Lore].[spHistoricalAges_GetFullInfoById]
  @Id INT,
  @CurrentAge INT = 0,
  @PrecedingAge INT = 0,
  @FollowingAge INT = 0
AS
BEGIN
  SET NOCOUNT ON;

  SET @CurrentAge = (SELECT TOP 1
    [Age]
  FROM [Lore].[HistoricalAges]
  WHERE [Id] = @Id);

  SET @PrecedingAge = @CurrentAge - 1;
  SET @FollowingAge = @CurrentAge + 1;

  SELECT
    [Id],
    [Age],
    [Description],
    [LengthInYears],
    @PrecedingAge AS [PrecedingAge],
    (SELECT TOP 1
      [Id]
    FROM [Lore].[HistoricalAges]
    WHERE [Age] = @PrecedingAge) AS [PrecedingAgeId],
    @FollowingAge AS [FollowingAge],
    (SELECT TOP 1
      [Id]
    FROM [Lore].[HistoricalAges]
    WHERE [Age] = @FollowingAge) AS [FollowingAgeId]
  FROM [Lore].[HistoricalAges]
  WHERE [Id] = @Id;

END
