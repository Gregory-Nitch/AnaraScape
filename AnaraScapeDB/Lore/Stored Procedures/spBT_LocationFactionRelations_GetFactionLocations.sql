CREATE PROCEDURE [Lore].[spBT_LocationFactionRelations_GetFactionLocations]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [FactionId],
    [Locations].[Name]
  FROM [Lore].[BT_LocationFactionRelations]
    INNER JOIN [Lore].[Locations] ON ([Locations].[Id] = [LocationId])
  WHERE [FactionId] = @Id;

END
