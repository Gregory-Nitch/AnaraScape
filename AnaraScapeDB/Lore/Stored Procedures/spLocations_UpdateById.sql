CREATE PROCEDURE [Lore].[spLocations_UpdateById]
	@Id INT,
	@Name VARCHAR(50),
	@Description VARCHAR(MAX),
	@RulingGovernmentId INT,
	@RulerId INT,
	@ContainingLocationId INT,
	@HasSubLocations BIT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Lore].[Locations]
	SET
		[Name] = @Name,
		[Description] = @Description,
		[RulingGovernmentId] = @RulingGovernmentId,
		[RulerId] = @RulerId,
		[ContainingLocationId] = @ContainingLocationId,
		[HasSubLocations] = @HasSubLocations
	WHERE [Id] = @Id;

END
