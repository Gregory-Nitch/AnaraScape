CREATE PROCEDURE [Lore].[spBT_LocationEventRelations_GetByCK]
	@LocationId INT,
	@EventId INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[LocationId],
		[EventId],
		[Locations].[Name] AS [LocationName],
		[Events].[Name] AS [EventName]
	FROM [Lore].[BT_LocationEventRelations]
		INNER JOIN [Lore].[Locations] ON ([Locations].[Id] = [LocationId])
		INNER JOIN [Lore].[Events] ON ([Events].[Id] = [EventId])
	WHERE [LocationId] = @LocationId AND [EventId] = @EventId;

END
