CREATE PROCEDURE [Lore].[spEvents_UpdateById]
	@Id INT,
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

	UPDATE [Lore].[Events]
	SET
		[Name] = @Name,
		[IsMultiDayEvent] = @IsMultiDayEvent,
		[Description] = @Description,
		[StartDate] = @StartDate,
		[StartAgeId] = @StartAgeId,
		[EndDate] = @EndDate,
		[EndAgeId] = @EndAgeId
	WHERE [Id] = @Id;

END
