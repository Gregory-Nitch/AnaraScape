CREATE TABLE [Lore].[BT_EventFactionRelations]
(
	[EventId] INT NOT NULL, 
    [FactionId] INT NOT NULL,
	PRIMARY KEY ([EventId], [FactionId]),
	CONSTRAINT [FK_EventFactionRelationEventId] FOREIGN KEY ([EventId]) 
		REFERENCES [Lore].[Events]([Id]),
	CONSTRAINT [FK_EventFactionRelationFactionId] FOREIGN KEY ([FactionId]) 
		REFERENCES [Lore].[Factions]([Id])
);
