CREATE PROCEDURE [Lore].[spArtifacts_GetLocationArtifacts]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		[Id],
		[Name]
	FROM [Lore].[Artifacts]
	WHERE [LocationId] = @Id
	ORDER BY [Name];

END
