CREATE PROCEDURE [Lore].[spEvents_InsertEvent]
	@Name VARCHAR(100),
	@IsMultiDayEvent BIT,
	@Description VARCHAR(MAX),
	@StartDate VARCHAR(MAX),
	@StartAgeId INT,
	@EndDate VARCHAR(MAX),
	@EndAgeId INT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Lore].[Events]
		([Name],
		[IsMultiDayEvent],
		[Description],
		[StartDate],
		[StartAgeId],
		[EndDate],
		[EndAgeId])
	VALUES
		(@Name,
		@IsMultiDayEvent,
		@Description,
		@StartDate,
		@StartAgeId,
		@EndDate,
		@EndAgeId);

END
