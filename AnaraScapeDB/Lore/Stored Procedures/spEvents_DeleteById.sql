CREATE PROCEDURE [Lore].[spEvents_DeleteById]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Lore].[Events] WHERE [Id] = @Id;

END
