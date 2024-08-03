CREATE PROCEDURE [Lore].[spResources_GetById]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[Id],
		[Name],
		[Description],
		[Rarity]
	FROM [Lore].[Resources]
	WHERE [Id] = @Id;

END
