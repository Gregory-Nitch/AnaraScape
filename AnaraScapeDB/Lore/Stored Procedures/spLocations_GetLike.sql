CREATE PROCEDURE [Lore].[spLocations_GetLike]
	@Name VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[Id],
		[Name],
		[Description],
		[RulingGovernmentId],
		[RulerId],
		[ContainingLocationId],
		[HasSubLocations]
	FROM [Lore].[Locations]
	WHERE [Name] LIKE '%'+@Name+'%';

END
