CREATE TABLE [Lore].[BT_LocationFactionRelations]
(
	[LocationId] INT NOT NULL,
	[FactionId] INT NOT NULL,
	PRIMARY KEY ([LocationId] , [FactionId]), 
	CONSTRAINT [FK_LocationFactionRelationLocationId] FOREIGN KEY ([LocationId]) 
		REFERENCES [Lore].[Locations]([Id]), 
    CONSTRAINT [FK_LocationFactionRelationFactionId] FOREIGN KEY ([FactionId]) 
		REFERENCES [Lore].[Factions]([Id]),
);
