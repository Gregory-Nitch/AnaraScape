CREATE PROCEDURE [Lore].[spEvents_GetAllIdNameTuples]
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Events];

END
