CREATE TABLE [Lore].[Locations]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] VARCHAR(50) NOT NULL, 
    [Description] VARCHAR(MAX) NULL, 
    [RulingGovernmentId] INT NULL, 
    [RulerId] INT NULL, 
    [ContainingLocationId] INT NULL, 
    CONSTRAINT [FK_RulingGovId] FOREIGN KEY ([RulingGovernmentId]) 
        REFERENCES [Lore].[Factions]([Id]), 
    CONSTRAINT [FK_RulerId] FOREIGN KEY ([RulerId]) 
        REFERENCES [Lore].[NPCs]([Id]), 
    CONSTRAINT [FK_ContainingLocationId] FOREIGN KEY ([ContainingLocationId]) 
        REFERENCES [Lore].[Locations]([Id])
);
