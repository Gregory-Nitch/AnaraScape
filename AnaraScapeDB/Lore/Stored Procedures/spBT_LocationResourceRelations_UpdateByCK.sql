CREATE PROCEDURE [Lore].[spBT_LocationResourceRelations_UpdateByCK]
	@LocationId INT,
	@ResourceId INT,
	@OldLocationId INT,
	@OldResourceId INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Lore].[BT_LocationResourceRelations]
	SET [LocationId] = @LocationId, [ResourceId] = @ResourceId
	WHERE [LocationId] = @OldLocationId AND [ResourceId] = @OldResourceId;

END
