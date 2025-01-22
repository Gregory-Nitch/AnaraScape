CREATE PROCEDURE [Lore].[spResources_GetAllIdNameTuples]
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Resources];

END
