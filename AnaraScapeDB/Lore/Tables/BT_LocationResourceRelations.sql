CREATE TABLE [Lore].[BT_LocationResourceRelations]
(
	[LocationId] INT NOT NULL,
	[ResourceId] INT NOT NULL,
	PRIMARY KEY ([LocationId], [ResourceId]),
	CONSTRAINT [FK_LocationResourceRelationLocationId] FOREIGN KEY ([LocationId]) 
		REFERENCES [Lore].[Locations]([Id]),
	CONSTRAINT [FK_LocationResourceRelationResourceId] FOREIGN KEY ([ResourceId]) 
		REFERENCES [Lore].[Resources]([Id])
);
