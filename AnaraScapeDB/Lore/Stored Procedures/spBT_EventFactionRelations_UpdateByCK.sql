CREATE PROCEDURE [Lore].[spBT_EventFactionRelations_UpdateByCK]
	@EventId INT,
	@FactionId INT,
	@OldEventId INT,
	@OldFactionId INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Lore].[BT_EventFactionRelations]
	SET [EventId] = @EventId, [FactionId] = @FactionId
	WHERE [EventId] = @OldEventId AND [FactionId] = @OldFactionId;

END
