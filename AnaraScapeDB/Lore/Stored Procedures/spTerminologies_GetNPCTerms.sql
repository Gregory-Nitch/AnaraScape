CREATE PROCEDURE [Lore].[spTerminologies_GetNPCTerms]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Terminologies]
  WHERE [InventorId] = @Id;

END
