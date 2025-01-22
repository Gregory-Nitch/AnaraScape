CREATE PROCEDURE [Lore].[spHistoricalAges_GetAllIdNameTuples]
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Age]
  FROM [Lore].[HistoricalAges];

END
