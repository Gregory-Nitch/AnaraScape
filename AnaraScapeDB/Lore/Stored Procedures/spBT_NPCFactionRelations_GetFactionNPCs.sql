CREATE PROCEDURE [Lore].[spBT_NPCFactionRelations_GetFactionNPCs]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [NPCId],
    [NPCs].[Name]
  FROM [Lore].[BT_NPCFactionRelations]
    INNER JOIN [Lore].[NPCs] ON ([NPCs].[Id] = [NPCId])
  WHERE [FactionId]  = @Id;

END
