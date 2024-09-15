CREATE TABLE [Lore].[Resources]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY,
    [Name] VARCHAR(100) NOT NULL,
    [Description] VARCHAR(MAX) NULL,
    [Rarity] INT NULL,
);

GO

CREATE TRIGGER [Lore].[DELETE_Resource]
    ON [Lore].[Resources]
    INSTEAD OF DELETE
    AS
    BEGIN
    SET NOCOUNT ON;

    -- DELETE from bridge table
    DELETE FROM [Lore].[BT_LocationResourceRelations]
            WHERE [ResourceId] IN (SELECT [Id]
    FROM DELETED);

    DELETE FROM [Lore].[Resources] WHERE [Id] IN (SELECT [Id]
    FROM DELETED);
END