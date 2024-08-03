CREATE PROCEDURE [Lore].[spFactions_DeleteById]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Lore].[Factions] WHERE [Id] = @Id;

END
