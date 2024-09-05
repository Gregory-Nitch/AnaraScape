CREATE PROCEDURE [Lore].[spNPCs_GetHistoricalAgeDeadNPCs]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[NPCs]
  WHERE [DeathAgeId] = @Id;

END
  