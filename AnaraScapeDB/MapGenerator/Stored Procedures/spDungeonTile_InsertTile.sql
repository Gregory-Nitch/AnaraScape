CREATE PROCEDURE [MapGenerator].[spDungeonTile_InsertTile]
  @Id INT,
  @Name NVARCHAR(100),
  @Style NVARCHAR(100),
  @Connections NVARCHAR(1000),
  @IsEntrance BIT,
  @IsStairs NVARCHAR(5),
  @FileName NVARCHAR(1000)

AS
BEGIN
  SET NOCOUNT ON;

  INSERT INTO [MapGenerator].[DungeonTiles]
    (
    [Id], [Name], [Style], [Connections], [IsEntrance], [IsStairs], [FileName]
    )
  VALUES
    (
      @Id, @Name, @Style, @Connections, @IsEntrance, @IsStairs, @FileName
);

END