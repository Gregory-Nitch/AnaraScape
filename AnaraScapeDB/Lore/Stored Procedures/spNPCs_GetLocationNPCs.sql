CREATE PROCEDURE [Lore].[spNPCs_GetLocationNPCs]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON

	SELECT
		[Id],
		[Name]
	FROM [Lore].[NPCs]
	WHERE [LocationId] = @Id
	ORDER BY [Name];

END
