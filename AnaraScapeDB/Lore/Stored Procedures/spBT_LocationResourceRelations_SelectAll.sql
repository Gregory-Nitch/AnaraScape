CREATE PROCEDURE [Lore].[spBT_LocationResourceRelations_SelectAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[LocationId],
		[ResourceId],
		[Locations].[Name] AS [LocationName],
		[Resources].[Name] AS [ResourceName]
	FROM [Lore].[BT_LocationResourceRelations]
		INNER JOIN [Lore].[Locations] ON ([Locations].[Id] = [LocationId])
		INNER JOIN [Lore].[Resources] ON ([Resources].[Id] = [ResourceId]);

END
