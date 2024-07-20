CREATE TABLE [Lore].[BT_NPCEventRelations]
(
	[NPCId] INT NOT NULL, 
    [EventId] INT NOT NULL,
	PRIMARY KEY ([NPCId], [EventId]), 
    CONSTRAINT [FK_NPCEventRelationNPCId] FOREIGN KEY ([NPCId]) 
        REFERENCES [Lore].[NPCs]([Id]), 
    CONSTRAINT [FK_NPCEventRelationEventId] FOREIGN KEY ([EventId]) 
        REFERENCES [Lore].[Events]([Id]),
);
