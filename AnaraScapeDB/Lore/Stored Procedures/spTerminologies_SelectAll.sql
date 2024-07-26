CREATE PROCEDURE [Lore].[spTerminologies_SelectAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[Id],
		[Name],
		[Definition],
		[InventorId],
		[InventionDate],
		[InventionAgeId]
	FROM [Lore].[Terminologies];

END
