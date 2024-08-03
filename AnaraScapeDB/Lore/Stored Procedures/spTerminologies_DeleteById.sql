CREATE PROCEDURE [Lore].[spTerminologies_DeleteById]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Lore].[Terminologies] WHERE [Id] = @Id;

END
