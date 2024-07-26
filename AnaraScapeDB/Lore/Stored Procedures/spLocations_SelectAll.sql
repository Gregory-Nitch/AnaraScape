CREATE PROCEDURE [Lore].[spLocations_SelectAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[Id],
		[Name],
		[Description],
		[RulingGovernmentId],
		[RulerId],
		[ContainingLocationId]
  FROM [Lore].[Locations]

END
