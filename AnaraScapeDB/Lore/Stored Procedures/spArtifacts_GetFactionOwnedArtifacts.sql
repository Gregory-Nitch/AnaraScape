CREATE PROCEDURE [Lore].[spArtifacts_GetFactionOwnedArtifacts]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Artifacts]
  WHERE [FactionOwnerId] = @Id;

END
