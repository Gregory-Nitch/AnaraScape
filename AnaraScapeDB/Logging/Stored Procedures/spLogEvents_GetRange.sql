
CREATE PROCEDURE [Logging].[spLogEvents_GetRange]
	@beginDate DATETIME2,
	@endDate DATETIME2
AS
BEGIN

	SET NOCOUNT ON;

	SELECT [Time], [Level], [Message]
	FROM [Logging].[LogEvents]
	WHERE [Time] <= @endDate 
	AND
	[Time] >= @beginDate;

END
