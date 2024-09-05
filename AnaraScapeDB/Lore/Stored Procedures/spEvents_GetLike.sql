CREATE PROCEDURE [Lore].[spEvents_GetLike]
  @Name VARCHAR(100)
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Events]
  WHERE [Name] LIKE '%'+@Name+'%';

END
