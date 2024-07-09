CREATE PROCEDURE [Logging].[spLogEvents_GetBefore]
	@date DATETIME2
AS
BEGIN
	SET NOCOUNT ON;

	SELECT [Time], [Level], [Message]
	FROM [Logging].[LogEvents]
	WHERE [Time] <= @date;
END
