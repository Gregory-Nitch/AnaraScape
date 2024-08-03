CREATE PROCEDURE [Lore].[spBT_EventFactionRelations_GetByCK]
	@EventId INT,
	@FactionId INT
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
		INNER JOIN [Lore].[Factions] ON ([Factions].[Id] = [FactionId])
	WHERE [EventId] = @EventId AND [FactionId] = @FactionId;

END
