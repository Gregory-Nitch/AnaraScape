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

-- Cinallis Countries (other acies and krukiathu not needed as each faction controls the continent)

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Tamel Imperium',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Cinallis')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'West Marches',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Cinallis')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Doaverine Junta',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Cinallis')
);

-- Salted tides sub locations

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Red Water',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Salted Tides')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Kaikyo',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Salted Tides')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Amunja',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Salted Tides')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Teokalli',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Salted Tides')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Alu''Teph',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Salted Tides')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Maoren',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Salted Tides')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Genshi',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Kaikyo')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Shianzong',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Kaikyo')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Ialistli',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Amunja')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Tlapetlan',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Amunja')
);

-- Tamel Imperium sub locations (first sub kingdoms)

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Dirmil Kingdom',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Tamel Imperium')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Tamel Kingdom',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Tamel Imperium')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Banewright Kingdom',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Tamel Imperium')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Deepstone Kingdom',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Tamel Imperium')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Frillis Cartuae',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dirmil Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Lendsberth',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dirmil Kindgom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Port Sod',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dirmil Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Halgarum',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Deepstone Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Deepstone',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'DeepStone Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Uskederth',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'DeepStone Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Bruessix',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dirmil Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Steel River',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Deepstone Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Myrtis',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Deepstone Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Ita',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Tamel Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Gatestown',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Tamel Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Wellsfort',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Tamel Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Tamel',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Tamel Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Tamsberth',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Tamel Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Tharkad',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Banewright Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Banesford',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Banewright Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Steinen',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Banewright Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        '1st Pillar',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Banewright Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        '2nd Pillar',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Tamel Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        '3rd Pillar',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Deepstone Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        '4th Pillar',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dirmil Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        '5th Pillar',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dirmil Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        '6th Pillar',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dirmil Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        '7th Pillar',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Tamel Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        '8th Pillar',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Banewright Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        '9th Pillar',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Banewright Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        '10th Pillar',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Banewright Kingdom')
);

-- West Marches Sub locations

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Venningen',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'West Marches')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Henreith',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'West Marches')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Zu''Wart',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'West Marches')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Karlshad',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'West Marches')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Gandersheim',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'West Marches')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Nir''Wart',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'West Marches')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Vak''Din Mort',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'West Marches')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Immenreuth',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'West Marches')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Annveild',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'West Marches')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Wussow',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'West Marches')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Zeigelheim',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'West Marches')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Illan',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'West Marches')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Errenthel',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'West Marches')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Vak''Din Mog',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'West Marches')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Narenel',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'West Marches')
);

-- Doaverine Junta sub locations (separated by woods 'Earrann')

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Earrann Uaine',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Doaverine Junta')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Earrann Geal',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Doaverine Junta')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Earrann Clach',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Doaverine Junta')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Grain',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Earrann Geal')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Mac''Tire',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Earrann Uaine')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Giliad',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Earrann Uaine')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Nathair',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Earrann Geal')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'D''Larrawil',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Earrann Geal')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Av''Naturen',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Earrann Geal')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Ur''Mithmirelen',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Earrann Geal')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Doaverhim',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Earrann Geal')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Iomair',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Earrann Clach')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Iolaire',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Earrann Clach')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Stal',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Earrann Clach')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Ur''Thendanril',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Earrann Clach')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Orn',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Earrann Clach')
);

-- Start of Acies sub locations (main sections = 'Domus')

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Scalar Domus',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Acies')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Scutum Domus',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Acies')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Frigus Domus',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Acies')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Kaled',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Scalar Domus')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Bellum',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Scalar Domus')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Lacus',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Scalar Domus')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Vita Nova',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Scalar Domus')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Luk''Teph',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Scutum Domus')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Ziet',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Scutum Domus')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Mulad',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Scutum Domus')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Novum',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Scutum Domus')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Amnis',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Scutum Domus')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Ormel',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Frigus Domus')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Sharm',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Frigus Domus')
);


INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Mazra',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Frigus Domus')
);


INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Sahil',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Frigus Domus')
);


INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Jaal',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Frigus Domus')
);


INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Villam',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Frigus Domus')
);


INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Astad',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Frigus Domus')
);


INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Jazir',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Frigus Domus')
);


-- Glaciem sub locations
-- Gladis is part of Acien government
INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Gladis',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Glaciem')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Turriuminverta',
        '',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Glaciem')
);
