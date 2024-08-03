CREATE PROCEDURE [Lore].[spBT_NPCFactionRelations_UpdateByCK]
	@NPCId INT,
	@FactionId INT,
	@OldNPCId INT,
	@OldFactionId INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Lore].[BT_NPCFactionRelations]
	SET [NPCId] = @NPCId, [FactionId] = @FactionId
	WHERE [NPCId] = @OldNPCId AND [FactionId] = @OldFactionId;

END
