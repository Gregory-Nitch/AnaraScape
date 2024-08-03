CREATE PROCEDURE [Lore].[spGeoMaps_UpdateById]
	@Id INT,
	@Name VARCHAR(200),
	@LocationId INT,
	@Filename VARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Lore].[GeoMaps]
	SET
		[Name] = @Name,
		[LocationId] = @LocationId,
		[Filename] = @Filename
	WHERE [Id] = @Id;

END
