CREATE TABLE [Lore].[Resources]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] VARCHAR(100) NOT NULL, 
    [Description] VARCHAR(MAX) NULL, 
    [Rarity] INT NULL,
);
