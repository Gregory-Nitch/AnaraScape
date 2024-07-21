CREATE TABLE [Lore].[HistoricalAges]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [AnaraAge] INT NOT NULL, 
    [Description] VARCHAR(MAX) NOT NULL, 
    [LengthInYears] INT NULL
);

GO

CREATE TRIGGER [Lore].[DELETE_HistoricalAge]
    ON [Lore].[HistoricalAges]
    INSTEAD OF DELETE
    AS
    BEGIN
        SET NoCount ON;

        -- Set nulls
        UPDATE [Lore].[Terminologies] SET [InventionAgeId] = NULL 
            WHERE [InventionAgeId] IN (SELECT [Id] FROM DELETED);
        UPDATE [Lore].[NPCs] SET [BirthAgeId] = NULL 
            WHERE [BirthAgeId] IN (SELECT [Id] FROM DELETED);
        UPDATE [Lore].[NPCs] SET [DeathAgeId] = NULL 
            WHERE [DeathAgeId] IN (SELECT [Id] FROM DELETED);
        UPDATE [Lore].[Events] SET [StartAgeId] = NULL 
            WHERE [StartAgeId] IN (SELECT [Id] FROM DELETED);
        UPDATE [Lore].[Events] SET [EndAgeId] = NULL 
            WHERE [EndAgeId] IN (SELECT [Id] FROM DELETED);
        UPDATE [Lore].[Artifacts] SET [CreationAgeId] = NULL
            WHERE [CreationAgeId] IN (SELECT [Id] FROM DELETED);
        UPDATE [Lore].[Artifacts] SET [LostAgeId] = NULL 
            WHERE [LostAgeId] IN (SELECT [Id] FROM DELETED);
        UPDATE [Lore].[Factions] SET [FoundingAgeId] = NULL
            WHERE [FoundingAgeId] IN (SELECT [Id] FROM DELETED);
        UPDATE [Lore].[Factions] SET [DisbandAgeId] = NULL
            WHERE [DisbandAgeId] IN (SELECT [Id] FROM DELETED);

        DELETE FROM [Lore].[HistoricalAges] WHERE [Id] IN (SELECT [Id] FROM DELETED);
    END
