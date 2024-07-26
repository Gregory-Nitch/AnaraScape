CREATE PROCEDURE [Lore].[spBT_EventFactionRelations_SelectAll]
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		[EventId],
		[FactionId],
		[Events].[Name] AS [EventName],
		[Factions].[Name] AS [FactionName]
	FROM [Lore].[BT_EventFactionRelations]
		INNER JOIN [Lore].[Events] ON ([Events].[Id] = [EventId])
		INNER JOIN [Lore].[Factions] ON ([Factions].[Id] = [FactionId]);

END
