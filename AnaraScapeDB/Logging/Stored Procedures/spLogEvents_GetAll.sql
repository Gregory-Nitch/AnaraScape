CREATE PROCEDURE [Logging].[spLogEvents_GetAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT [Time], [Level], [Message]
	FROM [Logging].[LogEvents];
END
