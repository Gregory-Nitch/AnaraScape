﻿
-- THIS DELETES ALL TILES FROM THE DATABASE!!!

CREATE PROCEDURE [MapGenerator].[spDungeonTiles_DeleteAllTiles]
AS
BEGIN

DELETE FROM [MapGenerator].[DungeonTiles];

END

-- THIS DELETES ALL TILES FROM THE DATABASE!!!