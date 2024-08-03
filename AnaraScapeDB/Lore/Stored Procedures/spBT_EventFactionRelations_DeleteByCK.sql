CREATE PROCEDURE [Lore].[spBT_EventFactionRelations_DeleteByCK]
	@EventId INT,
	@FactionId INT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Lore].[BT_EventFactionRelations]
	WHERE [EventId] = @EventId AND [FactionId] = @FactionId;

END
