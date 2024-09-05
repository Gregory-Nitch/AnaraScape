CREATE PROCEDURE [Lore].[spTerminologies_GetLike]
  @Name VARCHAR(100)
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Terminologies]
  WHERE [Name] = @Name;

END
