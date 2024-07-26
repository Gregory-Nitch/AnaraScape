CREATE PROCEDURE [Lore].[spBT_NPCFactionRelations_SelectAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[NPCId],
		[FactionId],
		[NPCs].[Name] AS [NPCName],
		[Factions].[Name] AS [FactionName]
	FROM [Lore].[BT_NPCFactionRelations]
		INNER JOIN [Lore].[NPCs] ON ([NPCs].[Id] = [NPCId])
		INNER JOIN [Lore].[Factions] ON ([Factions].[Id] = [FactionId]);

END
