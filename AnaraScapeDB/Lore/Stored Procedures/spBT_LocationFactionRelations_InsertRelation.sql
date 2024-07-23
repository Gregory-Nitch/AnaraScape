CREATE PROCEDURE [Lore].[spBT_LocationFactionRelations_InsertRelation]
	@LocationId INT,
	@FactionId INT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Lore].[BT_LocationFactionRelations]
		([LocationId], [FactionId])
	VALUES
		(@LocationId, @FactionId);

END