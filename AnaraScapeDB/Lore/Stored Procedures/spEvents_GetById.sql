CREATE PROCEDURE [Lore].[spEvents_GetById]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[Id],
		[Name],
		[IsMultiDayEvent],
		[Description],
		[StartDate],
		[StartAgeId],
		[EndDate],
		[EndAgeId]
	FROM [Lore].[Events]
	WHERE [Id] = @Id;
		
END
