CREATE PROCEDURE [Lore].[spHistoricalAges_GetById]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[Id],
		[Age],
		[Description],
		[LengthInYears]
	FROM [Lore].[HistoricalAges]
	WHERE [Id] = @Id;

END
