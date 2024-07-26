CREATE PROCEDURE [Lore].[spEvents_SelectAll]
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
      FROM [Lore].[Events];

END
