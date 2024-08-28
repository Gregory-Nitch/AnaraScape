CREATE PROCEDURE [Lore].[spBT_LocationFactionRelations_GetLocationFactions]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[BT_LocationFactionRelations].[FactionId],
		[Factions].[Name]
	FROM [Lore].[BT_LocationFactionRelations]
		INNER JOIN [Lore].[Factions] ON
			([Factions].[Id] = [FactionId])
	WHERE [LocationId] = @Id
	ORDER BY [Factions].[Name];

END
