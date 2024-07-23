CREATE PROCEDURE [Lore].[spBT_LocationEventRelations_InsertRelation]
	@LocationId INT,
	@EventId INT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Lore].[BT_LocationEventRelations]
		([LocationId], [EventId])
	VALUES
		(@LocationId, @EventId);
	
END
