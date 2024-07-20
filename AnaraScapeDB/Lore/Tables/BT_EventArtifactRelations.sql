CREATE TABLE [Lore].[BT_EventArtifactRelations]
(
	[EventId] INT NOT NULL,
	[ArtifactId] INT NOT NULL,
	PRIMARY KEY ([EventId], [ArtifactId]),
	CONSTRAINT [FK_EventArtifactRelationEventId] FOREIGN KEY ([EventId]) 
		REFERENCES [Lore].[Events]([Id]),
	CONSTRAINT [FK_EventArtifactRelationArtifactId] FOREIGN KEY ([ArtifactId]) 
		REFERENCES [Lore].[Artifacts]([Id]),
);
