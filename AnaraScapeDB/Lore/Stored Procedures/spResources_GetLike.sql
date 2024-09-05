CREATE PROCEDURE [Lore].[spResources_GetLike]
  @Name VARCHAR(100)
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Resources]
  WHERE [Name] LIKE '%'+@Name+'%';

END
  