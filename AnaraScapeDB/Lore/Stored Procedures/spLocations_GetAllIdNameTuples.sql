CREATE PROCEDURE [Lore].[spLocations_GetAllIdNameTuples]
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Locations]

END