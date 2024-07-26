CREATE PROCEDURE [Lore].[spBT_EventArtifactRelations_SelectAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[EventId],
		[ArtifactId],
		[Events].[Name] AS EventName,
		[Artifacts].[Name] AS ArtifactName
	FROM [Lore].[BT_EventArtifactRelations]
		INNER JOIN [Lore].[Events] ON ([Events].[Id] = [EventId])
		INNER JOIN [Lore].[Artifacts] ON ([Artifacts].[Id] = [ArtifactId]);

END
