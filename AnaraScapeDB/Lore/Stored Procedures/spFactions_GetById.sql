CREATE PROCEDURE [Lore].[spFactions_GetById]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[Id],
		[Name],
		[Description],
		[LeaderId],
		[FoundingDate],
		[FoundingAgeId],
		[DisbandDate],
		[DisbandAgeId]
	FROM [Lore].[Factions]
	WHERE [Id] = @Id;

END
