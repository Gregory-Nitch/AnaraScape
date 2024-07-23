CREATE PROCEDURE [Lore].[spGeoMaps_InsertGeoMap]
	@Name VARCHAR(200),
	@LocationId INT,
	@Filename VARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Lore].[GeoMaps]
		([Name], [LocationId], [Filename])
	VALUES
		(@Name, @LocationId, @Filename);

END
