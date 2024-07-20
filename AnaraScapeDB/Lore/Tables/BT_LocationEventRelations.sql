CREATE TABLE [Lore].[BT_LocationEventRelations]
(
	[LocationId] INT NOT NULL,
	[EventId] INT NOT NULL,
	PRIMARY KEY ([LocationId], [EventId]), 
    CONSTRAINT [FK_LocationEventRelationLocationId] FOREIGN KEY ([LocationId]) 
		REFERENCES [Lore].[Locations]([Id]), 
    CONSTRAINT [FK_LocationEventRelationEventId] FOREIGN KEY ([EventId]) 
		REFERENCES [Lore].[Events]([Id]),
);
