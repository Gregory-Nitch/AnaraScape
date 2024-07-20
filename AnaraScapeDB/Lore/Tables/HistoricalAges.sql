CREATE TABLE [Lore].[HistoricalAges]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [AnaraAge] VARCHAR(50) NOT NULL, 
    [Description] VARCHAR(MAX) NOT NULL, 
    [LengthInYears] INT NULL
);
