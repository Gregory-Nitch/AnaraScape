CREATE PROCEDURE [Lore].[spBT_EventArtifactRelations_UpdateByCK]
	@EventId INT,
	@ArtifactId INT,
	@OldEventId INT,
	@OldArtifactId INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Lore].[BT_EventArtifactRelations]
	SET [EventId] = @EventId, [ArtifactId] = @ArtifactId 
	WHERE [EventId] = @OldEventId AND [ArtifactId] = @OldArtifactId;

END
