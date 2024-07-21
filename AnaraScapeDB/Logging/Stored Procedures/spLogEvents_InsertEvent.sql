CREATE PROCEDURE [Logging].[spLogEvents_InsertEvent]
	@Time DATETIME2,
	@Level INT,
	@Message  VARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Logging].[LogEvents]
		([Time], [Level], [Message])
	VALUES
		(@Time, @Level, @Message);
END
