CREATE PROCEDURE [Lore].[spBT_EventFactionRelations_InsertRelation]
	@EventId INT,
	@FactionId INT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Lore].[BT_EventFactionRelations]
		([EventId], [FactionId])
	VALUES
		(@EventId, @FactionId);

END
