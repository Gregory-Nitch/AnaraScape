CREATE PROCEDURE [Lore].[spArtifacts_GetNPCOwnedArtifacts]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Artifacts]
  WHERE [NPCOwnerId] = @Id;

END
