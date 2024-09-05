CREATE PROCEDURE [Lore].[spArtifacts_GetHistoricalAgeLostArtifacts]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Artifacts]
  WHERE [LostAgeId] = @Id;

END
