CREATE PROCEDURE [Lore].[spGeoMaps_GetLike]
  @Name VARCHAR(200)
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[GeoMaps]
  WHERE [Name] LIKE '%'+@Name+'%';

END
