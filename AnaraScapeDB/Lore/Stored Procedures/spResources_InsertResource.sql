CREATE PROCEDURE [Lore].[spResources_InsertResource]
	@Name VARCHAR(100),
	@Description VARCHAR(MAX),
	@Rarity INT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Lore].[Resources]
		([Name], [Description], [Rarity])
	VALUES
		(@Name, @Description, @Rarity);	

END
