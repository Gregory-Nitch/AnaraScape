CREATE PROCEDURE [MapGenerator].[spDungeonTiles_GetAllTiles]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[Id],
		[TileName],
		[Style],
		[Connections],
		[IsEntrance],
		[IsStairs],
		[Filename]
	FROM [MapGenerator].[DungeonTiles];
END	
