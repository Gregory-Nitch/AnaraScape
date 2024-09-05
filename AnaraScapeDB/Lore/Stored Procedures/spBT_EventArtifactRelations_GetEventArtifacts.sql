CREATE PROCEDURE [Lore].[spBT_EventArtifactRelations_GetEventArtifacts]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [ArtifactId],
    [Artifacts].[Name]
  FROM [Lore].[BT_EventArtifactRelations]
    INNER JOIN [Lore].[Artifacts] ON ([Artifacts].[Id] = [ArtifactId])
  WHERE [EventId] = @Id;

END
