CREATE PROCEDURE [Lore].[spEvents_GetHistoricalAgeEndingEvents]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Events]
  WHERE [EndAgeId] = @Id;

END
