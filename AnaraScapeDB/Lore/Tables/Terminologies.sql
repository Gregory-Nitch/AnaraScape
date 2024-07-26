CREATE TABLE [Lore].[Terminologies]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] VARCHAR(100) NOT NULL, 
    [Definition] VARCHAR(MAX) NULL, 
    [InventorId] INT NULL, 
    [InventionDate] VARCHAR(MAX) NULL, 
    [InventionAgeId] INT NULL, 
    CONSTRAINT [FK_InventorId] FOREIGN KEY ([InventorId]) 
        REFERENCES [Lore].[NPCs]([Id]), 
    CONSTRAINT [FK_InventionAgeId] FOREIGN KEY ([InventionAgeId]) 
        REFERENCES [Lore].[HistoricalAges]([Id])
);
