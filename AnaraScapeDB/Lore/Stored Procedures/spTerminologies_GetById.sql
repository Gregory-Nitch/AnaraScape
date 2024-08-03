CREATE PROCEDURE [Lore].[spTerminologies_GetById]
	@Id INT
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
	FROM [Lore].[Terminologies]
	WHERE [Id] = @Id;

END
