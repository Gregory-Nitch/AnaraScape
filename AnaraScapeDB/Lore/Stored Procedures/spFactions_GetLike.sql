CREATE PROCEDURE [Lore].[spFactions_GetLike]
  @Name VARCHAR(100)
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Factions]
  WHERE [Name] LIKE '%'+@Name+'%';

END
