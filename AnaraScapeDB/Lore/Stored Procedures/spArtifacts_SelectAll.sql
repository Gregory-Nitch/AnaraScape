CREATE PROCEDURE [Lore].[spArtifacts_SelectAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		[Id],
		[Name],
		[Description],
		[LocationId],
		[OwnerType],
		[NPCOwnerId],
		[FactionOwnerId],
		[CreatorType],
		[NPCCreatorId],
		[FactionCreatorId],
		[CreationDate],
		[CreationAgeId],
		[LostDate],
		[LostAgeId]
	FROM [Lore].[Artifacts];

END
