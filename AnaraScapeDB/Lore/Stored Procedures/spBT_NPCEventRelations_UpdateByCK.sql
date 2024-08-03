CREATE PROCEDURE [Lore].[spBT_NPCEventRelations_UpdateByCK]
	@NPCId INT,
	@EventId INT,
	@OldNPCId INT,
	@OldEventId INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Lore].[BT_NPCEventRelations]
	SET [NPCId] = @NPCId, [EventId] = @EventId
	WHERE [NPCId] = @OldNPCId AND [EventId] = @OldEventId;

END
