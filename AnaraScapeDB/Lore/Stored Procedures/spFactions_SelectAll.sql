CREATE PROCEDURE [Lore].[spFactions_SelectAll]
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
  FROM [Lore].[Factions];

END
