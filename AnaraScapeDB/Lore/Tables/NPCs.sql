CREATE TABLE [Lore].[NPCs]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] VARCHAR(100) NOT NULL, 
    [Race] VARCHAR(30) NOT NULL, 
    [Description] VARCHAR(MAX) NOT NULL, 
    [Biography] VARCHAR(MAX) NOT NULL, 
    [Title] VARCHAR(100) NULL, 
    [LevelOrCR] VARCHAR(4) NULL, 
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
