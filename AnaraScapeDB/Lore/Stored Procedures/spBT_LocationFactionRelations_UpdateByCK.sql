CREATE PROCEDURE [Lore].[spBT_LocationFactionRelations_UpdateByCK]
	@LocationId INT,
	@FactionId INT,
	@OldLocationId INT,
	@OldFactionId INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Lore].[BT_LocationFactionRelations]
	SET [LocationId] = @LocationId, [FactionId] = @FactionId
	WHERE [LocationId] = @OldLocationId AND [FactionId] = @OldFactionId;

END
