CREATE PROCEDURE [Lore].[spBT_NPCFactionRelations_InsertRelation]
	@NPCId INT,
	@FactionId INT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Lore].[BT_NPCFactionRelations]
		([NPCId], [FactionId])
	VALUES
		(@NPCId, @FactionId);

END
