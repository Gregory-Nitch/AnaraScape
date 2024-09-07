CREATE PROCEDURE [Lore].[spBT_NPCFactionRelations_GetNPCMemberFactions]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [FactionId],
    [Factions].[Name]
  FROM [Lore].[BT_NPCFactionRelations]
    INNER JOIN [Lore].[Factions] ON ([Factions].[Id] = [FactionId])
  WHERE [NPCId] = @Id;

END
