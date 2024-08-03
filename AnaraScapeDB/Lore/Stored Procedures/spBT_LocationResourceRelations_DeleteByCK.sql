CREATE PROCEDURE [Lore].[spBT_LocationResourceRelations_DeleteByCK]
	@LocationId INT,
	@ResourceId INT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Lore].[BT_LocationResourceRelations]
	WHERE [LocationId] = @LocationId AND [ResourceId] = @ResourceId;

END
