CREATE PROCEDURE [Lore].[spBT_LocationEventRelations_DeleteByCK]
	@LocationId INT,
	@EventId INT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Lore].[BT_LocationEventRelations]
	WHERE [LocationId] = @LocationId AND [EventId] = @EventId;

END
