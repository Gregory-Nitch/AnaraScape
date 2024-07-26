CREATE PROCEDURE [Lore].[spTerminologies_InsertTerm]
	@Name VARCHAR(100),
	@Definition VARCHAR(MAX),
	@InventorId INT,
	@InventionDate VARCHAR(MAX),
	@InventionAgeId INT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Lore].[Terminologies]
		([Name], [Definition], [InventorId], [InventionDate], [InventionAgeId])
	VALUES
		(@Name, @Definition, @InventorId, @InventionDate, @InventionAgeId);

END
