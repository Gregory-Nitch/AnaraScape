CREATE PROCEDURE [Lore].[spBT_LocationEventRelations_GetLocationEvents]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON

	SELECT
		[BT_LocationEventRelations].[EventId],
		[Events].[Name]
	FROM [Lore].[BT_LocationEventRelations]
		INNER JOIN [Lore].[Events] ON 
			([Events].[Id] = [BT_LocationEventRelations].[EventId])
	WHERE [LocationId] = @Id
	ORDER BY [Events].[Name];

END
