CREATE PROCEDURE [Lore].[spNPCs_GetAllIdNameTuples]
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[NPCs];

END
