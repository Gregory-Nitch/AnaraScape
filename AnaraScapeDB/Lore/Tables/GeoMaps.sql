CREATE TABLE [Lore].[GeoMaps]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] VARCHAR(200) NOT NULL, 
    [LocationId] INT NOT NULL,
    [Filename] VARCHAR(MAX) NOT NULL, 
    CONSTRAINT [FK_GeoMapLocationId] FOREIGN KEY ([LocationId]) 
    REFERENCES [Lore].[Locations]([Id])
);
