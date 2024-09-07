CREATE PROCEDURE [Lore].[spBT_NPCEventRelations_GetNPCEvents]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [EventId],
    [Events].[Name]
  FROM [Lore].[BT_NPCEventRelations]
    INNER JOIN [Lore].[Events] ON ([Events].[Id] = [EventId])
  WHERE [NPCId] = @Id;

END
