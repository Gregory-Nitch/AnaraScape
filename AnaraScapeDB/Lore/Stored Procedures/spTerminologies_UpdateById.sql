CREATE PROCEDURE [Lore].[spTerminologies_UpdateById]
	@Id INT,
	@Name VARCHAR(100),
	@Definition VARCHAR(MAX),
	@InventorId INT,
	@InventionDate VARCHAR(MAX),
	@InventionAgeId INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Lore].[Terminologies]
	SET 
		[Name] = @Name,
		[Definition] = @Definition,
		[InventorId] = @InventorId,
		[InventionDate] = @InventionDate,
		[InventionAgeId] = @InventionAgeId
	WHERE [Id] = @Id;

END
