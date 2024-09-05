CREATE PROCEDURE [Lore].[spNPCs_GetLike]
  @Name VARCHAR(100)
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[NPCs]
  WHERE [Name] LIKE '%'+@Name+'%';

END
