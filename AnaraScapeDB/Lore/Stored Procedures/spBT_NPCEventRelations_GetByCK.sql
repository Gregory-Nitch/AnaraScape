CREATE PROCEDURE [Lore].[spBT_NPCEventRelations_GetByCK]
	@NPCId INT,
	@EventId INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[NPCId],
		[EventId],
		[NPCs].[Name] AS [NPCName],
		[Events].[Name] AS [EventName]
	FROM [Lore].[BT_NPCEventRelations]
		INNER JOIN [Lore].[NPCs] ON ([NPCs].[Id] = [NPCId])
		INNER JOIN [Lore].[Events] ON ([Events].[Id] = [EventId])
	WHERE [NPCId] = @NPCId AND [EventId] = @EventId;

END
