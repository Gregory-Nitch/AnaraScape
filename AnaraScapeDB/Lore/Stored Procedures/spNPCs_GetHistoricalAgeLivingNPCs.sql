CREATE PROCEDURE [Lore].[spNPCs_GetHistoricalAgeLivingNPCs]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[NPCs]
  WHERE [BirthAgeId] = @Id;

END
  