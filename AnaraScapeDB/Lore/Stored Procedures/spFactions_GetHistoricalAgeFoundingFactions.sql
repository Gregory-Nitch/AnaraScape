CREATE PROCEDURE [Lore].[spFactions_GetHistoricalAgeFoundingFactions]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Factions]
  WHERE [FoundingAgeId] = @Id;

END
