CREATE PROCEDURE [Lore].[spTerminologies_InsertTerm]
	@Term VARCHAR(100),
	@Definition VARCHAR(MAX),
	@InventorId INT,
	@InventionDate VARCHAR(MAX),
	@InventionAgeId INT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Lore].[Terminologies]
		([Term], [Definition], [InventorId], [InventionDate], [InventionAgeId])
	VALUES
		(@Term, @Definition, @InventorId, @InventionDate, @InventionAgeId);

END
