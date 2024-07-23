CREATE PROCEDURE [Lore].[spBT_NPCEventRelations_InsertRelation]
	@NPCId INT,
	@EventId INT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Lore].[BT_NPCEventRelations]
		([NPCId], [EventId])
	VALUES
		(@NPCId, @EventId);
	
END
