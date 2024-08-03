CREATE PROCEDURE [Lore].[spHistoricalAges_DeleteById]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Lore].[HistoricalAges] WHERE [Id] = @Id;

END
