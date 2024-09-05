CREATE PROCEDURE [Lore].[spArtifacts_GetLike]
  @Name VARCHAR(100)
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Artifacts]
  WHERE [Name] LIKE '%'+@Name+'%';

END
