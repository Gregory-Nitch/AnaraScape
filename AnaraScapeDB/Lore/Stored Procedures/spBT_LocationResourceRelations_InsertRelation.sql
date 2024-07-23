CREATE PROCEDURE [Lore].[spBT_LocationResourceRelations_InsertRelation]
	@LocationId INT,
	@ResourceId INT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Lore].[BT_LocationResourceRelations]
		([LocationId], [ResourceId])
	VALUES
		(@LocationId, @ResourceId);

END
