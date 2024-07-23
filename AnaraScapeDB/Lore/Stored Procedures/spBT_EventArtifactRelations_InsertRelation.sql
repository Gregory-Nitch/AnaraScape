CREATE PROCEDURE [Lore].[spBT_EventArtifactRelations_InsertRelation]
	@EventId INT,
	@ArtifactId INT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Lore].[BT_EventArtifactRelations]
		([EventId], [ArtifactId])
	VALUES
		(@EventId, @ArtifactId);

END
	