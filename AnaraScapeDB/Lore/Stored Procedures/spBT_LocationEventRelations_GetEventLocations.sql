CREATE PROCEDURE [Lore].[spBT_LocationEventRelations_GetEventLocations]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [LocationId],
    [Locations].[Name]
  FROM [Lore].[BT_LocationEventRelations]
    INNER JOIN [Lore].[Locations] ON ([Locations].[Id] = [LocationId])
  WHERE [EventId] = @Id;

END
