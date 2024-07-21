CREATE TABLE [Lore].[NPCs]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] VARCHAR(100) NOT NULL, 
    [Race] VARCHAR(30) NOT NULL, 
    [Description] VARCHAR(MAX) NOT NULL, 
    [Biography] VARCHAR(MAX) NOT NULL, 
    [Title] VARCHAR(100) NULL, 
    [LevelOrCR] VARCHAR(6) NULL, 
    [Speed] INT NULL, 
    [HitPoints] INT NULL, 
    [ArmorClass] INT NULL, 
    [StatArray] VARCHAR(36) NULL, 
    [ProficiencyBonus] INT NULL, 
    [SpellSaveDC] INT NULL, 
    [SpellList] VARCHAR(MAX) NULL, 
    [SaveProficienciesList] VARCHAR(MAX) NULL, 
    [SkillProficienciesList] VARCHAR(MAX) NULL, 
    [ItemProficienciesList] VARCHAR(MAX) NULL, 
    [ActionList] VARCHAR(MAX) NULL, 
    [FeatureList] VARCHAR(MAX) NULL, 
    [EquipmentList] VARCHAR(MAX) NULL, 
    [LocationId] INT NULL, 
    [BirthDate] VARCHAR(MAX) NULL, 
    [BirthAgeId] INT NULL, 
    [DeathDate] VARCHAR(MAX) NULL, 
    [DeathAgeId] INT NULL, 
    CONSTRAINT [FK_NPCLocationId] FOREIGN KEY ([LocationId]) 
        REFERENCES [Lore].[Locations]([Id]), 
    CONSTRAINT [FK_BirthAgeId] FOREIGN KEY ([BirthAgeId]) 
        REFERENCES [Lore].[HistoricalAges]([Id]), 
    CONSTRAINT [FK_DeathAgeId] FOREIGN KEY ([DeathAgeId]) 
        REFERENCES [Lore].[HistoricalAges]([Id])
);

GO

CREATE TRIGGER [Lore].[DELETE_NPC]
    ON [Lore].[NPCs]
    INSTEAD OF DELETE
    AS
    BEGIN
        SET NoCount ON;
        
        -- Set nulls
        UPDATE [Lore].[Terminologies] SET [InventorId] = NULL 
            WHERE [InventorId] IN (SELECT [Id] FROM DELETED);
        UPDATE [Lore].[Artifacts] SET [NPCOwnerId] = NULL 
            WHERE [NPCOwnerId] IN (SELECT [Id] FROM DELETED);
        UPDATE [Lore].[Artifacts] SET [NPCCreatorId] = NULL 
            WHERE [NPCCreatorId] IN (SELECT [Id] FROM DELETED);
        UPDATE [Lore].[Locations] SET [RulerId] = NULL
            WHERE [RulerId] IN (SELECT [Id] FROM DELETED); 
        UPDATE [Lore].[Factions] SET [LeaderId] = NULL
            WHERE [LeaderId] IN (SELECT [Id] FROM DELETED);

        -- DELETE from bridge tables
        DELETE FROM [Lore].[BT_NPCEventRelations] 
            WHERE [NPCId] IN (SELECT [Id] FROM DELETED);
        DELETE FROM [Lore].[BT_NPCFactionRelations] 
            WHERE [NPCId] IN (SELECT [Id] FROM DELETED);

        DELETE FROM [Lore].[NPCs] WHERE [Id] IN (SELECT [Id] FROM DELETED);
    END
