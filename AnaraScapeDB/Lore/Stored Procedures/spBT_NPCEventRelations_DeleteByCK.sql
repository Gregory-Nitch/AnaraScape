CREATE PROCEDURE [Lore].[spBT_NPCEventRelations_DeleteByCK]
	@NPCId INT,
	@EventId INT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Lore].[BT_NPCEventRelations]
	WHERE [NPCId] = @NPCId AND [EventId] = @EventId;

END
