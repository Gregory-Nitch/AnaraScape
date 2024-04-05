-- Create schema
CREATE SCHEMA [MapGenerator];
GO

CREATE TABLE [MapGenerator].[DungeonTiles]
(
  [Id] INT NOT NULL PRIMARY KEY IDENTITY,
  [Name] NVARCHAR(100) NOT NULL,
  [Style] NVARCHAR(100) NOT NULL,
  [Connections] NVARCHAR(1000) NOT NULL,
  [IsEntrance] BIT NOT NULL,
  [IsStairs] NVARCHAR(5) NOT NULL,
  [FileName] NVARCHAR(1000) NOT NULL
);