CREATE PROCEDURE [Lore].[spArtifacts_InsertArtifact]
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

	INSERT INTO [Lore].[Artifacts] 
		([Name], 
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
		[LostAgeId])
	VALUES
		(@Name,
		@Description,
		@LocationId,
		@OwnerType,
		@NPCOwnerId,
		@FactionOwnerId,
		@CreatorType,
		@NPCCreatorId,
		@FactionCreatorId,
		@CreationDate,
		@CreationAgeId,
		@LostDate,
		@LostAgeId);

END
