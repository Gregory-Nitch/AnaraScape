CREATE PROCEDURE [Lore].[spHistoricalAges_UpdateById]
	@Id INT,
	@Age INT,
	@Description VARCHAR(MAX),
	@LengthInYears INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Lore].[HistoricalAges]
	SET
		[Age] = @Age,
		[Description] = @Description,
		[LengthInYears] = @LengthInYears
	WHERE [Id] = @Id;

END
