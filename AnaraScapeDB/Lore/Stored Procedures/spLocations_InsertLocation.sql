CREATE PROCEDURE [Lore].[spLocations_InsertLocation]
	@Name VARCHAR(50),
	@Description VARCHAR(MAX),
	@RulingGovernmentId INT,
	@RulerId INT,
	@ContainingLocationId INT,
	@HasSubLocations BIT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Lore].[Locations]
		([Name],
		[Description],
		[RulingGovernmentId],
		[RulerId],
		[ContainingLocationId],
		[HasSubLocations])
	VALUES(
			@Name,
			@Description,
			@RulingGovernmentId,
			@RulerId,
			@ContainingLocationId,
			@HasSubLocations
		);

END
