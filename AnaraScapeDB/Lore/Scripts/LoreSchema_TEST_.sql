/*
	Script for testing the Lore Schema delete tiggers
*/

-- Insert to main tables
INSERT INTO [Lore].[Artifacts] ([Name], [Description], [CreationDate], [LostDate])
	VALUES ('artifact1', 'artifact1 description', '100-1-2', '100-1-3');

INSERT INTO [Lore].[Artifacts] ([Name], [Description], [CreationDate])
	VALUES ('artifact2', 'artifact2 description', '200-2-4');


INSERT INTO [Lore].[Events] ([Name], [IsMultiDayEvent], [Description], [StartDate], [EndDate]) 
	VALUES('event1', 'TRUE', 'event1 descrption', '100-1-3', '123-2-4');

INSERT INTO [Lore].[Events] ([Name], [IsMultiDayEvent], [Description], [StartDate])
	VALUES ('event2', 'FALSE', 'event2 description', '321-3-4');


INSERT INTO [Lore].[Factions] ([Name], [Description], [FoundingDate], [DisbandDate])
	VALUES ('faction1', 'faction1 description', '123-3-4', '543-4-3');

INSERT INTO [Lore].[Factions] ([Name], [Description], [FoundingDate])
	VALUES ('faction2', 'faction2 description', '234-2-5');


INSERT INTO [Lore].[HistoricalAges] ([AnaraAge], [Description], [LengthInYears])
	VALUES (0, 'ag1 description', 123);

INSERT INTO [Lore].[HistoricalAges] ([AnaraAge], [Description], [LengthInYears])
	VALUES (1, 'age2 description', 345);


INSERT INTO [Lore].[Locations] ([Name], [Description])
	VALUES ('location1', 'location1 description');

INSERT INTO [Lore].[Locations] ([Name], [Description])
	VALUES ('location2', 'loaction2 description');

INSERT INTO [Lore].[Locations] ([Name], [Description], [ContainingLocationId])
	VALUES ('location1subloc', 'location1subloc description', 
	(SELECT [Id] FROM [Lore].[Locations] WHERE [Name] = 'location1'));


INSERT INTO [Lore].[GeoMaps] ([Name], [LocationId], [Filename])
	VALUES ('geomap1', (SELECT [Id] FROM [Lore].[Locations] WHERE [Name] = 'location1'), 'geomapfilname1');

INSERT INTO [Lore].[GeoMaps] ([Name], [LocationId], [Filename])
	VALUES ('geomap2', (SELECT [Id] FROM [Lore].[Locations] WHERE [Name] = 'location2'), 'geomapfilname2');

INSERT INTO [Lore].[GeoMaps] ([Name], [LocationId], [Filename])
	VALUES ('geomap3', (SELECT [Id] FROM [Lore].[Locations] WHERE [Name] = 'location1subloc'), 'geomapfilname3');


INSERT INTO [Lore].[NPCs] ([Name], [Race], [Description], [Biography], [BirthDate], [DeathDate])
	VALUES ('npc1', 'race1', 'npc1 description', 'npc1 bio', '123-3-4', '234-4-6');

INSERT INTO [Lore].[NPCs] ([Name], [Race], [Description], [Biography], [BirthDate])
	VALUES ('npc2', 'race2', 'npc2 description', 'npc2 bio', '234-3-6');


INSERT INTO [Lore].[Resources] ([Name], [Description], [Rarity])
	VALUES ('resource1', 'resource1 description', 1);

INSERT INTO [Lore].[Resources] ([Name], [Description], [Rarity])
	VALUES ('resource2', 'resource2 description', 2);


INSERT INTO [Lore].[Terminologies] ([Term], [Definition], [InventionDate])
	VALUES ('term1', 'term1 definition', '123-3-4');

INSERT INTO [Lore].[Terminologies] ([Term], [Definition], [InventionDate])
	VALUES ('term2', 'term2 definition', '345-2-4');


-- Update main tables
UPDATE [Lore].[Artifacts] 
	SET [LocationId] = (SELECT [Id] FROM [Lore].[Locations] WHERE [Name] = 'location1'),
	[OwnerType] = 0,
	[NPCOwnerId] = (SELECT [Id] FROM [Lore].[NPCs] WHERE [Name] = 'npc1'),
	[CreatorType] = 1,
	[FactionCreatorId] = (SELECT [Id] FROM [Lore].[Factions] WHERE [Name] = 'faction1'),
	[CreationAgeId] = (SELECT [Id] FROM [Lore].[HistoricalAges] WHERE [AnaraAge] = 0),
	[LostAgeId] = (SELECT [Id] FROM [Lore].[HistoricalAges] WHERE [AnaraAge] = 1)
	WHERE [Name] = 'artifact1';


UPDATE [Lore].[Artifacts]
	SET [LocationId] = (SELECT [Id] FROM [Lore].[Locations] WHERE [Name] = 'location2'),
	[OwnerType] = 1,
	[FactionOwnerId] = (SELECT [Id] FROM [Lore].[Factions] WHERE [Name] = 'faction2'),
	[CreatorType] = 0,
	[NPCCreatorId] = (SELECT [Id] FROM [Lore].[NPCs] WHERE [Name] = 'npc2'),
	[CreationAgeId] = (SELECT [Id] FROM [Lore].[HistoricalAges] WHERE [AnaraAge] = 0)
	WHERE [Name] = 'artifact2';


UPDATE [Lore].[Events]
	SET [StartAgeId] = (SELECT [Id] FROM [Lore].[HistoricalAges] WHERE [AnaraAge] = 0),
	[EndAgeId] = (SELECT [Id] FROM [Lore].[HistoricalAges] WHERE [AnaraAge] = 1)
	WHERE [Name] = 'event1';

UPDATE [Lore].[Events]
	SET [StartAgeId] = (SELECT [Id] FROM [Lore].[HistoricalAges] WHERE [AnaraAge] = 1)
	WHERE [Name] = 'event2';


UPDATE [Lore].[Factions]
	SET [LeaderId] = (SELECT [Id] FROM [Lore].[NPCs] WHERE [Name] = 'npc1'),
	[FoundingAgeId] = (SELECT [Id] FROM [Lore].[HistoricalAges] WHERE [AnaraAge] = 0),
	[DisbandAgeId] = (SELECT [Id] FROM [Lore].[HistoricalAges] WHERE [AnaraAge] = 1)
	WHERE [Name] = 'faction1';

UPDATE [Lore].[Factions]
	SET [LeaderId] = (SELECT [Id] FROM [Lore].[NPCs] WHERE [Name] = 'npc2'),
	[FoundingAgeId] = (SELECT [Id] FROM [Lore].[HistoricalAges] WHERE [AnaraAge] = 0)
	WHERE [Name] = 'faction2';


UPDATE [Lore].[Locations]
	SET [RulingGovernmentId] = (SELECT [Id] FROM [Lore].[Factions] WHERE [Name] = 'faction1'),
	[RulerId] = (SELECT [Id] FROM [Lore].[NPCs] WHERE [Name] = 'npc1')
	WHERE [Name] = 'location1';

UPDATE [Lore].[Locations]
	SET [RulingGovernmentId] = (SELECT [Id] FROM [Lore].[Factions] WHERE [Name] = 'faction1'),
	[RulerId] = (SELECT [Id] FROM [Lore].[NPCs] WHERE [Name] = 'npc1')
	WHERE [Name] = 'location1subloc';

UPDATE [Lore].[Locations]
	SET [RulingGovernmentId] = (SELECT [Id] FROM [Lore].[Factions] WHERE [Name] = 'faction2'),
	[RulerId] = (SELECT [Id] FROM [Lore].[Factions] WHERE [Name] = 'npc2')
	WHERE [Name] = 'location2';


UPDATE [Lore].[NPCs]
	SET [LocationId] = (SELECT [Id] FROM [Lore].[Locations] WHERE [Name] = 'location1'),
	[BirthAgeId] = (SELECT [Id] FROM [Lore].[HistoricalAges] WHERE [AnaraAge] = 0),
	[DeathAgeId] = (SELECT [Id] FROM [Lore].[HistoricalAges] WHERE [AnaraAge] = 1)
	WHERE [Name] = 'npc1';

UPDATE [Lore].[NPCs]
	SET [LocationId] = (SELECT [Id] FROM [Lore].[Locations] WHERE [Name] = 'location2'),
	[BirthAgeId] = (SELECT [Id] FROM [Lore].[HistoricalAges] WHERE [AnaraAge] = 1)
	WHERE [Name] = 'npc2';


UPDATE [Lore].[Terminologies]
	SET [InventorId] = (SELECT [Id] FROM [Lore].[NPCs] WHERE [Name] = 'npc1'),
	[InventionAgeId] = (SELECT [Id] FROM [Lore].[HistoricalAges] WHERE [AnaraAge] = 0)
	WHERE [Term] = 'term1';

UPDATE [Lore].[Terminologies]
	SET [InventorId] = (SELECT [Id] FROM [Lore].[NPCs] WHERE [Name] = 'npc2'),
	[InventionAgeId] = (SELECT [Id] FROM [Lore].[HistoricalAges] WHERE [AnaraAge] = 1)
	WHERE [Term] = 'term2';


-- B table connecting
INSERT INTO [Lore].[BT_EventArtifactRelations] ([EventId], [ArtifactId])
	VALUES ((SELECT [Id] FROM [Lore].[Events] WHERE [Name] = 'event1'),
	(SELECT [Id] FROM [Lore].[Artifacts] WHERE [Name] = 'artifact1'));

INSERT INTO [Lore].[BT_EventArtifactRelations] ([EventId], [ArtifactId])
	VALUES ((SELECT [Id] FROM [Lore].[Events] WHERE [Name] = 'event2'),
	(SELECT [Id] FROM [Lore].[Artifacts] WHERE [Name] = 'artifact2'));


INSERT INTO [Lore].[BT_EventFactionRelations] ([EventId], [FactionId])
	VALUES ((SELECT [Id] FROM [Lore].[Events] WHERE [Name] = 'event1'),
	(SELECT [Id] FROM [Lore].[Factions] WHERE [Name] = 'faction1'));

INSERT INTO [Lore].[BT_EventFactionRelations] ([EventId], [FactionId])
	VALUES ((SELECT [Id] FROM [Lore].[Events] WHERE [Name] = 'event2'),
	(SELECT [Id] FROM [Lore].[Factions] WHERE [Name] = 'faction2'));


INSERT INTO [Lore].[BT_LocationEventRelations] ([LocationId], [EventId])
	VALUES ((SELECT [Id] FROM [Lore].[Locations] WHERE [Name] = 'location1'),
	(SELECT [Id] FROM [Lore].[Events] WHERE [Name] = 'event1'));

INSERT INTO [Lore].[BT_LocationEventRelations] ([LocationId], [EventId])
	VALUES ((SELECT [Id] FROM [Lore].[Locations] WHERE [Name] = 'location2'),
	(SELECT [Id] FROM [Lore].[Events] WHERE [Name] = 'event2'));


INSERT INTO [Lore].[BT_LocationFactionRelations] ([LocationId], [FactionId])
	VALUES ((SELECT [Id] FROM [Lore].[Locations] WHERE [Name] = 'location1'),
	(SELECT [Id] FROM [Lore].[Factions] WHERE [Name] = 'faction1'));

INSERT INTO [Lore].[BT_LocationFactionRelations] ([LocationId], [FactionId])
	VALUES ((SELECT [Id] FROM [Lore].[Locations] WHERE [Name] = 'location2'),
	(SELECT [Id] FROM [Lore].[Factions] WHERE [Name] = 'faction2'));


INSERT INTO [Lore].[BT_LocationResourceRelations] ([LocationId], [ResourceId])
	VALUES ((SELECT [Id] FROM [Lore].[Locations] WHERE [Name] = 'location1'),
	(SELECT [Id] FROM [Lore].[Resources] WHERE [Name] = 'resource1'));

INSERT INTO [Lore].[BT_LocationResourceRelations] ([LocationId], [ResourceId])
	VALUES ((SELECT [Id] FROM [Lore].[Locations] WHERE [Name] = 'location2'),
	(SELECT [Id] FROM [Lore].[Resources] WHERE [Name] = 'resource2'));


INSERT INTO [Lore].[BT_NPCEventRelations] ([NPCId], [EventId])
	VALUES ((SELECT [Id] FROM [Lore].[NPCs] WHERE [Name] = 'npc1'),
	(SELECT [Id] FROM [Lore].[Events] WHERE [Name] = 'event1'));

INSERT INTO [Lore].[BT_NPCEventRelations] ([NPCId], [EventId])
	VALUES ((SELECT [Id] FROM [Lore].[NPCs] WHERE [Name] = 'npc2'),
	(SELECT [Id] FROM [Lore].[Events] WHERE [Name] = 'event2'));


INSERT INTO [Lore].[BT_NPCFactionRelations] ([NPCId], [FactionId])
	VALUES ((SELECT [Id] FROM [Lore].[NPCs] WHERE [Name] = 'npc1'),
	(SELECT [Id] FROM [Lore].[Factions] WHERE [Name] = 'faction1'));

INSERT INTO [Lore].[BT_NPCFactionRelations] ([NPCId], [FactionId])
	VALUES ((SELECT [Id] FROM [Lore].[NPCs] WHERE [Name] = 'npc2'),
	(SELECT [Id] FROM [Lore].[Factions] WHERE [Name] = 'faction2'));


-- Mutating sql here

--DELETE FROM [Lore].[BT_EventArtifactRelations] WHERE ([EventId] = 1 AND [ArtifactId] = 1);


-- Resulting table states

SELECT * FROM [Lore].[Artifacts];
SELECT * FROM [Lore].[Events];
SELECT * FROM [Lore].[Factions];
SELECT * FROM [Lore].[GeoMaps];
SELECT * FROM [Lore].[HistoricalAges];
SELECT * FROM [Lore].[Locations];
SELECT * FROM [Lore].[NPCs];
SELECT * FROM [Lore].[Resources];
SELECT * FROM [Lore].[Terminologies];
SELECT * FROM [Lore].[BT_EventArtifactRelations];
SELECT * FROM [Lore].[BT_EventFactionRelations];
SELECT * FROM [Lore].[BT_LocationEventRelations];
SELECT * FROM [Lore].[BT_LocationFactionRelations];
SELECT * FROM [Lore].[BT_LocationResourceRelations];
SELECT * FROM [Lore].[BT_NPCEventRelations];
SELECT * FROM [Lore].[BT_NPCFactionRelations];


-- Test clean up

--DELETE FROM [Lore].[Artifacts];
--DELETE FROM [Lore].[Events];
--DELETE FROM [Lore].[Factions];
--DELETE FROM [Lore].[GeoMaps];
--DELETE FROM [Lore].[HistoricalAges];
--DELETE FROM [Lore].[Locations];
--DELETE FROM [Lore].[NPCs];
--DELETE FROM [Lore].[Resources];
--DELETE FROM [Lore].[Terminologies];

