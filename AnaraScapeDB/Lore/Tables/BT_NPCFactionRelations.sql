CREATE TABLE [Lore].[BT_NPCFactionRelations]
(
	[NPCId] INT NOT NULL, 
    [FactionId] INT NOT NULL,
	PRIMARY KEY ([NPCId], [FactionId]), 
    CONSTRAINT [FK_NPCFactionRelationNPCId] FOREIGN KEY ([NPCId]) 
        REFERENCES [Lore].[NPCs]([Id]), 
    CONSTRAINT [FK_NPCFactionRelationFactionId] FOREIGN KEY ([FactionId]) 
        REFERENCES [Lore].[Factions]([Id]),
);
