CREATE PROCEDURE [Lore].[spFactions_UpdateById]
	@Id INT,
	@Name VARCHAR(100),
	@Description VARCHAR(MAX),
	@LeaderId INT,
	@FoundingDate VARCHAR(MAX),
	@FoundingAgeId INT,
	@DisbandDate VARCHAR(MAX),
	@DisbandAgeId INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Lore].[Factions]
	SET
		[Name] = @Name,
		[Description] = @Description,
		[LeaderId] = @LeaderId,
		[FoundingDate] = @FoundingDate,
		[FoundingAgeId] = @FoundingAgeId,
		[DisbandDate] = @DisbandDate,
		[DisbandAgeId] = @DisbandAgeId
	WHERE [Id] = @Id;

END
