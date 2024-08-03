CREATE PROCEDURE [Lore].[spGeoMaps_GetById]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[Id],
		[Name],
		[LocationId],
		[Filename]
	FROM [Lore].[GeoMaps]
	WHERE [Id] = @Id;

END
