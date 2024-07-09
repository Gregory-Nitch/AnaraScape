CREATE PROCEDURE [Logging].[spLogEvents_InsertEvent]
	@Time DATETIME2,
	@Level VARCHAR(50),
	@Message  VARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Logging].[LogEvents]
		([Time], [Level], [Message])
	VALUES
		(@Time, @Level, @Message);
END
