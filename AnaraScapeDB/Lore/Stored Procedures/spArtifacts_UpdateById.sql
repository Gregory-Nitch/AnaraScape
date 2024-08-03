CREATE PROCEDURE [Lore].[spArtifacts_UpdateById]
	@Id INT,
	@Name VARCHAR(100),
	@Description VARCHAR(MAX),
	@LocationId INT,
	@OwnerType INT,
	@NPCOwnerId INT,
	@FactionOwnerId INT,
	@CreatorType INT,
	@NPCCreatorId INT,
	@FactionCreatorId INT,
	@CreationDate VARCHAR(MAX),
	@CreationAgeId INT,
	@LostDate VARCHAR(MAX),
	@LostAgeId INT

AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Lore].[Artifacts] SET
		[Name] = @Name,
		[Description] = @Description,
		[LocationId] = @LocationId,
		[OwnerType] = @OwnerType,
		[NPCOwnerId] = @NPCOwnerId,
		[FactionOwnerId] = @FactionOwnerId,
		[CreatorType] = @CreatorType,
		[NPCCreatorId] = @NPCCreatorId,
		[FactionCreatorId] = @FactionCreatorId,
		[CreationDate] = @CreationDate,
		[CreationAgeId] = @CreationAgeId,
		[LostDate] = @LostDate,
		[LostAgeId] = @LostAgeId
	WHERE [Id] = @Id;

END
