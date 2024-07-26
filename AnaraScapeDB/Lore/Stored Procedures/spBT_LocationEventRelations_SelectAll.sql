CREATE PROCEDURE [Lore].[spBT_LocationEventRelations_SelectAll]
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
		INNER JOIN [Lore].[Events] ON ([Events].[Id] = [EventId]);

END
