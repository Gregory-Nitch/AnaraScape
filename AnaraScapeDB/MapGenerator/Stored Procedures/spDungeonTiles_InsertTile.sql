
CREATE PROCEDURE [MapGenerator].[spDungeonTiles_InsertTile]
	@TileName VARCHAR(50),
	@Style VARCHAR(50),
	@Connections VARCHAR(1000),
	@IsEntrance BIT,
	@IsStairs VARCHAR(5),
	@Filename VARCHAR(1000)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [MapGenerator].[DungeonTiles]
	(TileName, Style, Connections, IsEntrance, IsStairs, Filename)
	VALUES (
	@TileName, 
	@Style, 
	@Connections, 
	@IsEntrance,
	@IsStairs,
	@Filename);

END
