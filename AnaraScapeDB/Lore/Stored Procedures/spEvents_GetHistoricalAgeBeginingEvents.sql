CREATE PROCEDURE [Lore].[spEvents_GetHistoricalAgeBeginingEvents]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Events]
  WHERE [StartAgeId] = @Id;

END
