CREATE PROCEDURE [Lore].[spGeoMaps_GetAllIdNameTuples]
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[GeoMaps]

END
