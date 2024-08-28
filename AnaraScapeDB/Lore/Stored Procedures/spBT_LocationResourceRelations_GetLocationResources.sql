CREATE PROCEDURE [Lore].[spBT_LocationResourceRelations_GetLocationResources]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[BT_LocationResourceRelations].[ResourceId],
		[Resources].[Name]
	FROM [Lore].[BT_LocationResourceRelations]
		INNER JOIN [Lore].[Resources] ON
			([Resources].[Id] = [ResourceId])
	WHERE [LocationId] = @Id
	ORDER BY [Resources].[Name];

END
