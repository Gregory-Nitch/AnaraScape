CREATE PROCEDURE [Lore].[spArtifacts_GetById]
	@Id INT
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
	FROM [Lore].[Artifacts]
		WHERE [Id] = @Id;
		
END
