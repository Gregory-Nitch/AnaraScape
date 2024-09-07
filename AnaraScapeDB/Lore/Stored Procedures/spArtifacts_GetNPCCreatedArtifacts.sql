CREATE PROCEDURE [Lore].[spArtifacts_GetNPCCreatedArtifacts]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Artifacts]
  WHERE [NPCCreatorId] = @Id;

END
  