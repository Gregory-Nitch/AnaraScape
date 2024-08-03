CREATE PROCEDURE [Lore].[spBT_LocationFactionRelations_GetByCK]
	@LocationId INT,
	@FactionId INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[LocationId],
		[FactionId],
		[Locations].[Name] AS [LocationName],
		[Factions].[Name] AS [FactionName]
	FROM [Lore].[BT_LocationFactionRelations]
		INNER JOIN [Lore].[Locations] ON ([Locations].[Id] = [LocationId])
		INNER JOIN [Lore].[Factions] ON ([Factions].[Id] = [FactionId])
	WHERE [LocationId] = @LocationId AND [FactionId] = @FactionId;

END
