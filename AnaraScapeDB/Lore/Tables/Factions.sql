CREATE TABLE [Lore].[Factions]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY,
    [Name] VARCHAR(100) NOT NULL,
    [Description] VARCHAR(MAX) NULL,
    [LeaderId] INT NULL,
    [FoundingDate] VARCHAR(MAX) NULL,
    [FoundingAgeId] INT NULL,
    [DisbandDate] VARCHAR(MAX) NULL,
    [DisbandAgeId] INT NULL,
    CONSTRAINT [FK_LeaderId] FOREIGN KEY ([LeaderId]) 
        REFERENCES [Lore].[NPCs]([Id]),
    CONSTRAINT [FK_FoundingAgeId] FOREIGN KEY ([FoundingAgeId]) 
        REFERENCES [Lore].[HistoricalAges]([Id]),
    CONSTRAINT [FK_DisbandAgeId] FOREIGN KEY ([DisbandAgeId]) 
        REFERENCES [Lore].[HistoricalAges]([Id])
);

GO

CREATE TRIGGER [Lore].[DELETE_Faction]
    ON [Lore].[Factions]
    INSTEAD OF DELETE
    AS
    BEGIN
    SET NOCOUNT ON;

    -- Set nulls
    UPDATE [Lore].[Locations] SET [RulingGovernmentId] = NULL
            WHERE [RulingGovernmentId] IN (SELECT [Id]
    FROM DELETED);
    UPDATE [Lore].[Artifacts] SET [FactionCreatorId] = NULL
            WHERE [FactionCreatorId] IN (SELECT [Id]
    FROM DELETED);
    UPDATE [Lore].[Artifacts]SET [FactionOwnerId] = NULL
            WHERE [FactionOwnerId] IN (SELECT [Id]
    FROM DELETED);

    -- DELETE from bridge tables
    DELETE FROM [Lore].[BT_EventFactionRelations]
            WHERE [FactionId] IN (SELECT [Id]
    FROM DELETED);
    DELETE FROM [Lore].[BT_LocationFactionRelations]
            WHERE [FactionId] IN (SELECT [Id]
    FROM DELETED);
    DELETE FROM [Lore].[BT_NPCFactionRelations]
            WHERE [FactionId] IN (SELECT [Id]
    FROM DELETED);

    DELETE FROM [Lore].[Factions] WHERE [Id] IN (SELECT [Id]
    FROM DELETED);
END
