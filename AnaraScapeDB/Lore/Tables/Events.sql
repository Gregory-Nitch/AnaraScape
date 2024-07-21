CREATE TABLE [Lore].[Events]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[Name] VARCHAR(100) NOT NULL,
	[IsMultiDayEvent] BIT NOT NULL,
	[Description] VARCHAR(MAX) NULL,
	[StartDate] VARCHAR(MAX) NULL,
	[StartAgeId] INT NULL,
	[EndDate] VARCHAR(MAX) NULL,
	[EndAgeId] INT NULL,
	CONSTRAINT [FK_StartAgeId] FOREIGN KEY ([StartAgeId]) 
		REFERENCES [Lore].[HistoricalAges]([Id]),
	CONSTRAINT [FK_EndAgeId] FOREIGN KEY ([EndAgeId]) 
		REFERENCES [Lore].[HistoricalAges]([Id])
);

GO

CREATE TRIGGER [Lore].[DELETE_Event]
    ON [Lore].[Events]
    INSTEAD OF DELETE
    AS
    BEGIN
        SET NoCount ON;

		-- DELETE from bridge tables
		DELETE FROM [Lore].[BT_EventArtifactRelations]
			WHERE [EventId] IN (SELECT [Id] FROM DELETED);
		DELETE FROM [Lore].[BT_EventFactionRelations]
			WHERE [EventId] IN (SELECT [Id] FROM DELETED);
		DELETE FROM [Lore].[BT_LocationEventRelations]
			WHERE [EventId] IN (SELECT [Id] FROM DELETED);
		DELETE FROM [Lore].[BT_NPCEventRelations]
			WHERE [EventId] IN (SELECT [Id] FROM DELETED);

		DELETE FROM [Lore].[Events] WHERE [Id] IN (SELECT [Id] FROM DELETED);
    END
