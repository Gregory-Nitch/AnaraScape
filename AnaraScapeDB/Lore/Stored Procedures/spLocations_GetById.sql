CREATE PROCEDURE [Lore].[spLocations_GetById]
	@Id INT
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
	WHERE [Id] = @Id;

END
