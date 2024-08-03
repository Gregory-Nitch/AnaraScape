CREATE PROCEDURE [Lore].[spBT_EventArtifactRelations_DeleteByCK]
	@EventId INT,
	@ArtifactId INT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Lore].[BT_EventArtifactRelations]
	WHERE [EventId] = @EventId AND [ArtifactId] = @ArtifactId;

END
