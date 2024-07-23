CREATE PROCEDURE [Lore].[spFactions_InsertFaction]
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

	INSERT INTO [Lore].[Factions]
		([Name],
		[Description],
		[LeaderId],
		[FoundingDate],
		[FoundingAgeId],
		[DisbandDate],
		[DisbandAgeId])
	VALUES
		(@Name,
		@Description,
		@LeaderId,
		@FoundingDate,
		@FoundingAgeId,
		@DisbandDate,
		@DisbandAgeId);

END
