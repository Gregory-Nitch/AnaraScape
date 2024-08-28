-- This file contains SQL statements that will be executed after the build script.

-- !!!
-- Lore Schema 
-- !!!
/*
* Anara Plane
*/
INSERT INTO [Lore].[Locations]
    ([Name],
    [Description])
VALUES(
        'Anara',
        ''
);

-- Anara Continents

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Acies',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Anara')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Cinallis',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Anara')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Glaciem',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Anara')
);


INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Krukiathu',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Anara')
);


INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Pale Wastes',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Anara')
);


INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Salted Tides',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Anara')
);

-- Anara Countries
