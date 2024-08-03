CREATE PROCEDURE [Lore].[spLocations_UpdateById]
	@Id INT,
	@Name VARCHAR(50),
	@Description VARCHAR(MAX),
	@RulingGovernmentId INT,
	@RulerId INT,
	@ContainingLocationId INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Lore].[Locations]
	SET
		[Name] = @Name,
		[Description] = @Description,
		[RulingGovernmentId] = @RulingGovernmentId,
		[RulerId] = @RulerId,
		[ContainingLocationId] = @ContainingLocationId
	WHERE [Id] = @Id;

END
