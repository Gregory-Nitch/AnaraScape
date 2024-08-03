CREATE PROCEDURE [Lore].[spGeoMaps_DeleteById]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Lore].[GeoMaps] WHERE [Id] = @Id;

END
