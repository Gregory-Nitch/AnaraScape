CREATE PROCEDURE [Lore].[spResources_UpdateById]
	@Id INT,
	@Name VARCHAR(100),
	@Description VARCHAR(MAX),
	@Rarity INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Lore].[Resources]
	SET
		[Name] = @Name,
		[Description] = @Description,
		[Rarity] = @Rarity
	WHERE [Id] = @Id;

END
