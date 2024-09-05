CREATE PROCEDURE [Lore].[spBT_EventFactionRelations_GetEventFactions]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [FactionId],
    [Factions].[Name]
  FROM [Lore].[BT_EventFactionRelations]
    INNER JOIN [Lore].[Factions] ON ([Factions].[Id] = [FactionId])
  WHERE [EventId] = @Id;

END
