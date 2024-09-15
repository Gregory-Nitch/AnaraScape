CREATE TABLE [Lore].[Artifacts]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[Name] VARCHAR(100) NOT NULL,
	[Description] VARCHAR(MAX) NULL,
	[LocationId] INT NULL,
	[OwnerType] INT NULL,
	[NPCOwnerId] INT NULL,
	[FactionOwnerId] INT NULL,
	[CreatorType] INT NULL,
	[NPCCreatorId] INT NULL,
	[FactionCreatorId] INT NULL,
	[CreationDate] VARCHAR(MAX) NULL,
	[CreationAgeId] INT NULL,
	[LostDate] VARCHAR(MAX) NULL,
	[LostAgeId] INT NULL,
	CONSTRAINT [FK_ArtifactLocationId] FOREIGN KEY ([LocationId]) 
		REFERENCES [Lore].[Locations]([Id]),
	CONSTRAINT [FK_NPCOwnerId] FOREIGN KEY ([NPCOwnerId]) 
		REFERENCES [Lore].[NPCs]([Id]),
	CONSTRAINT [FK_FactionOwnerId] FOREIGN KEY ([FactionOwnerId]) 
		REFERENCES [Lore].[Factions]([Id]),
	CONSTRAINT [FK_NPCCreatorId] FOREIGN KEY ([NPCCreatorId]) 
		REFERENCES [Lore].[NPCs]([Id]),
	CONSTRAINT [FK_FactionCreatorId] FOREIGN KEY ([FactionCreatorId]) 
		REFERENCES [Lore].[Factions]([Id]),
	CONSTRAINT [FK_CreationAgeId] FOREIGN KEY ([CreationAgeId]) 
		REFERENCES [Lore].[HistoricalAges]([Id]),
	CONSTRAINT [FK_LostAgeId] FOREIGN KEY ([LostAgeId]) 
		REFERENCES [Lore].[HistoricalAges]([Id])
);

GO

CREATE TRIGGER [Lore].[DELETE_Artifact]
    ON [Lore].[Artifacts]
    INSTEAD OF DELETE
    AS
    BEGIN
	SET NOCOUNT ON;

	-- DELETE from bridge tables
	DELETE FROM [Lore].[BT_EventArtifactRelations]
			WHERE [ArtifactId] IN (SELECT [Id]
	FROM DELETED);

	DELETE FROM [Lore].[Artifacts] WHERE [Id] IN (SELECT [Id]
	FROM DELETED);
END
