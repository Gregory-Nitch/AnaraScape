CREATE PROCEDURE [Lore].[spTerminologies_GetAllIdNameTuples]
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Terminologies];

END
