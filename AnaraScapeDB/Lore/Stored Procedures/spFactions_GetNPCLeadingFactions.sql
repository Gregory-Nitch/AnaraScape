CREATE PROCEDURE [Lore].[spFactions_GetNPCLeadingFactions]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [Id],
    [Name]
  FROM [Lore].[Factions]
  WHERE [LeaderId] = @Id;

END
