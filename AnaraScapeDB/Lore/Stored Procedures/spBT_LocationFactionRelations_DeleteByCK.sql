CREATE PROCEDURE [Lore].[spBT_LocationFactionRelations_DeleteByCK]
	@LocationId INT,
	@FactionId INT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Lore].[BT_LocationFactionRelations]
	WHERE [LocationId] = @LocationId AND [FactionId] = @FactionId;

END
