CREATE PROCEDURE [Lore].[spArtifacts_SelectAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [Lore].[Artifacts];

END
