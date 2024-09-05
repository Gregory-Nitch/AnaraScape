CREATE PROCEDURE [Lore].[spArtifacts_GetFactionCreatedArtifacts]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Artifacts]
  WHERE [FactionCreatorId] = @Id;

END
