CREATE PROCEDURE [Lore].[spArtifacts_DeleteById]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Lore].[Artifacts] WHERE [Id] = @Id;

END
