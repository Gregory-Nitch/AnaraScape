CREATE PROCEDURE [Lore].[spHistoricalAges_SelectAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		[Id],
		[Age],
		[Description],
		[LengthInYears]
  FROM [Lore].[HistoricalAges];

END
