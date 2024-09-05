CREATE PROCEDURE [Lore].[spFactions_GetHistoricalAgeDisbandingFactions]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Factions]
  WHERE [DisbandAgeId] = @Id;

END
