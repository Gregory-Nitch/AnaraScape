CREATE TABLE [Lore].[Locations]
(
        [Id] INT NOT NULL PRIMARY KEY IDENTITY,
        [Name] VARCHAR(50) NOT NULL,
        [Description] VARCHAR(MAX) NULL,
        [RulingGovernmentId] INT NULL,
        [RulerId] INT NULL,
        [ContainingLocationId] INT NULL,
        [HasSubLocations] BIT DEFAULT 'FALSE'
                CONSTRAINT [FK_RulingGovId] FOREIGN KEY ([RulingGovernmentId]) 
        REFERENCES [Lore].[Factions]([Id]),
        CONSTRAINT [FK_RulerId] FOREIGN KEY ([RulerId]) 
        REFERENCES [Lore].[NPCs]([Id]),
        CONSTRAINT [FK_ContainingLocationId] FOREIGN KEY ([ContainingLocationId]) 
        REFERENCES [Lore].[Locations]([Id])
);

GO

CREATE TRIGGER [Lore].[DELETE_Location]
    ON [Lore].[Locations]
    INSTEAD OF DELETE
    AS
    BEGIN
        SET NOCOUNT ON;

        -- Set nulls
        UPDATE [Lore].[Locations] SET [ContainingLocationId] = NULL 
            WHERE [ContainingLocationId] IN (SELECT [Id]
        FROM DELETED);
        UPDATE [Lore].[NPCs] SET [LocationId] = NULL 
            WHERE [LocationId] IN (SELECT [Id]
        FROM DELETED);
        UPDATE [Lore].[Artifacts] SET [LocationId] = NULL 
            WHERE [LocationId] IN (SELECT [Id]
        FROM DELETED);

        -- DELETE from bridge tables and GeoMaps (due to nonnullable fields)
        DELETE FROM [Lore].[GeoMaps] 
            WHERE [LocationId] IN (SELECT [Id]
        FROM DELETED);
        DELETE FROM [Lore].[BT_LocationEventRelations]
            WHERE [LocationId] IN (SELECT [Id]
        FROM DELETED);
        DELETE FROM [Lore].[BT_LocationFactionRelations]
            WHERE [LocationId] IN (SELECT [Id]
        FROM DELETED);
        DELETE FROM [Lore].[BT_LocationResourceRelations]
            WHERE [LocationId] IN (SELECT [Id]
        FROM DELETED);

        DELETE FROM [Lore].[Locations] WHERE [Id] IN (SELECT [Id]
        FROM DELETED);
END
