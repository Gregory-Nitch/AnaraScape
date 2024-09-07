CREATE PROCEDURE [Lore].[spLocations_GetNPCRulingLocations]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Locations]
  WHERE [RulerId] = @Id;

END
