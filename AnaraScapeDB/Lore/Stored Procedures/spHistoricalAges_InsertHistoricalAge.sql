CREATE PROCEDURE [Lore].[spHistoricalAges_InsertHistoricalAge]
	@Age INT,
	@Description VARCHAR(MAX),
	@LengthInYears INT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Lore].[HistoricalAges]
		([AnaraAge], [Description], [LengthInYears])
	VALUES
		(@Age, @Description, @LengthInYears);

END
