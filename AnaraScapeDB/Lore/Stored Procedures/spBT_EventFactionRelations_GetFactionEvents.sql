CREATE PROCEDURE [Lore].[spBT_EventFactionRelations_GetFactionEvents]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [EventId],
    [Events].[Name]
  FROM [Lore].[BT_EventFactionRelations]
    INNER JOIN [Lore].[Events] ON ([Events].[Id] = [EventId])
  WHERE [FactionId] = @Id;

END
