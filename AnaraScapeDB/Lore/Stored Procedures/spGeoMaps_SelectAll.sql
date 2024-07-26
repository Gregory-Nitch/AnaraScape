CREATE PROCEDURE [Lore].[spGeoMaps_SelectAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
        [Id],
		[Name],
		[LocationId],
		[Filename]
  FROM [Lore].[GeoMaps]

END
