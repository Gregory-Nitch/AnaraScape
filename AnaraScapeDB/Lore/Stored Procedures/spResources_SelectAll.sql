CREATE PROCEDURE [Lore].[spResources_SelectAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[Id],
		[Name],
		[Description],
		[Rarity]
  FROM [Lore].[Resources];

END
