CREATE TABLE [Lore].[Factions]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] VARCHAR(100) NOT NULL, 
    [Description] VARCHAR(MAX) NULL, 
    [LeaderId] INT NULL, 
    [FoundingDate] VARCHAR(MAX) NULL, 
    [FoundingAgeId] INT NULL, 
    [DisbandDate] VARCHAR(MAX) NULL, 
    [DisbandAgeId] INT NULL, 
    CONSTRAINT [FK_LeaderId] FOREIGN KEY ([LeaderId]) 
        REFERENCES [Lore].[NPCs]([Id]),
    CONSTRAINT [FK_FoundingAgeId] FOREIGN KEY ([FoundingAgeId]) 
        REFERENCES [Lore].[HistoricalAges]([Id]),
    CONSTRAINT [FK_DisbandAgeId] FOREIGN KEY ([DisbandAgeId]) 
        REFERENCES [Lore].[HistoricalAges]([Id])
);
