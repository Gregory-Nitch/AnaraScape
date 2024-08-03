CREATE PROCEDURE [Lore].[spBT_NPCFactionRelations_DeleteByCK]
	@NPCId INT,
	@FactionId INT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Lore].[BT_NPCFactionRelations]
	WHERE [NPCId] = @NPCId AND [FactionId] = @FactionId;

END
