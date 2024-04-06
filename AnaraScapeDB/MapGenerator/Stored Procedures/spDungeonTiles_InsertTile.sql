
CREATE PROCEDURE [MapGenerator].[spDungeonTiles_InsertTile]
	@Id INT,
	@TileName VARCHAR(50),
	@Style VARCHAR(50),
	@Connections VARCHAR(1000),
	@IsEntrance BIT,
	@IsStairs VARCHAR(5),
	@FileName VARCHAR(1000)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [MapGenerator].[DungeonTiles]
	(Id, TileName, Style, Connections, IsEntrance, IsStairs, FileName)
	VALUES (@Id,
	@TileName, 
	@Style, 
	@Connections, 
	@IsEntrance,
	@IsStairs,
	@FileName);

END
