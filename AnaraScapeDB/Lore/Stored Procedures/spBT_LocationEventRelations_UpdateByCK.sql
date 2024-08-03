CREATE PROCEDURE [Lore].[spBT_LocationEventRelations_UpdateByCK]
	@LocationId INT,
	@EventId INT,
	@OldLocationId INT,
	@OldEventId INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Lore].[BT_LocationEventRelations]
	SET [LocationId] = @LocationId, [EventId] = @EventId
	WHERE [LocationId] = @OldLocationId AND [EventId] = @OldEventId;

END
