
CREATE TABLE [MapGenerator].[DungeonTiles]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [TileName] VARCHAR(50) NOT NULL, 
    [Style] VARCHAR(50) NOT NULL, 
    [Connections] VARCHAR(1000) NOT NULL, 
    [IsEntrance] BIT NOT NULL, 
    [IsStairs] VARCHAR(5) NOT NULL, 
    [Filename] VARCHAR(1000) NOT NULL 
);
