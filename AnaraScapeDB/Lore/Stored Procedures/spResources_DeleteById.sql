CREATE PROCEDURE [Lore].[spResources_DeleteById]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Lore].[Resources] WHERE [Id] = @Id;

END
