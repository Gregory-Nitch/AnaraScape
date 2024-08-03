CREATE PROCEDURE [Lore].[spLocations_DeleteById]
	@Id INT
AS
BEGIN 
	SET NOCOUNT ON;

	DELETE FROM [Lore].[Locations] WHERE [Id] = @Id;

END
