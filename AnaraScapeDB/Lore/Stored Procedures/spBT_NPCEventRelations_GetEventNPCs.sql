CREATE PROCEDURE [Lore].[spBT_NPCEventRelations_GetEventNPCs]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [NPCId],
    [NPCs].[Name]
  FROM [Lore].[BT_NPCEventRelations]
    INNER JOIN [Lore].[NPCs] ON ([NPCs].[Id] = [NPCId])
  WHERE [EventId] = @Id;

END
