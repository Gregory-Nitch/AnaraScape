CREATE PROCEDURE [Lore].[spBT_LocationResourceRelations_GetResourceLocations]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [LocationId],
    [Locations].[Name]
  FROM [Lore].[BT_LocationResourceRelations]
    INNER JOIN [Lore].[Locations] ON ([Locations].[Id] = [LocationId])
  WHERE [ResourceId] = @Id;

END
