CREATE PROCEDURE [Lore].[spArtifacts_GetHistoricalAgeCreatedArtifacts]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Artifacts]
  WHERE [CreationAgeId]  = @Id;

END
