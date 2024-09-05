CREATE PROCEDURE [Lore].[spBT_EventArtifactRelations_GetArtifactEvents]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [EventId],
    [Events].[Name]
  FROM [Lore].[BT_EventArtifactRelations]
    INNER JOIN [Lore].[Events] ON ([Events].[Id] = [EventId])
  WHERE [ArtifactId]  = @Id;

END
