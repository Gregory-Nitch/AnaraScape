CREATE PROCEDURE [Lore].[spBT_LocationFactionRelations_GetFactionLocations]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    *
  FROM [Lore].[BT_LocationFactionRelations]
  WHERE [FactionId] = @Id;

END
