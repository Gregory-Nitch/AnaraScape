-- This file contains SQL statements that will be executed after the build script.


/*
* Clear out prior table information (mainly for dev envrionment)
*/
DELETE FROM [Lore].[Artifacts];
DELETE FROM [Lore].[Events];
DELETE FROM [Lore].[Factions];
DELETE FROM [Lore].[GeoMaps];
DELETE FROM [Lore].[HistoricalAges];
DELETE FROM [Lore].[Locations];
DELETE FROM [Lore].[NPCs];
DELETE FROM [Lore].[Resources];
DELETE FROM [Lore].[Terminologies];


-- !!! ---------------------------------------------------------------------------------------------
-- Lore Schema ------------------------------------------------------------------------------------- 
-- !!! ---------------------------------------------------------------------------------------------

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description])
VALUES(
        'Solis Sphere',
        'Sphere beyond The Ulatum Veil (nebula + asteroid belt) which is also known as the Sea of Stars to those who live on the plane of Anara. The Solis Sphere is located North East of galactic center just beyond the edge of the galaxy. The Solis Sphere contains the following planes created by the gods from the remains of the primordial titans native to the sphere; Anara, Anara''s moon Lundus (dark gray gas giant, titan corpse), Fusilia (molten planet), Gelida (frozen planet), Lapis (barren rocky planet). In reality Anara orbits Lundus as its moon as Anara is dwarfed by Lundus in size.'
);

/*
* Anara Plane Locations
*/
INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Anara',
        'Anara was made from the elements and the titans related to them by the gods. From the earth and fire elements the soil and its molten core was formed. From water the oceans were made, from wind and lightning, rain and other weather was created. Anara has 5 continents with 4 main governments, islands dot the oceans, and the poles have ice caps to the north and south. Many ruins from ancient times can be found both above and below ground. The Western Hemisphere is known as the Acient and the East as the Cinalent. The Plane contains the following continents and major regions; Acies, Cinallis, Glaciem, Krukiathu, The Pale Wastes and The Salted Tides. The mortal races of Anara are normally separated by their ties to the gods that made them. This has lead to a large amount of segrigation and racism on the plane. Anara has 336 days in a year, 12 months and 7 days in a week. Every first of the month the giant moon Lundus eclipses Solis and paints Anara in a dull red light, these days are called Lundus days, and the first of the year is called Lundyer. This eclipse blocks the celestial haven of Solis from contact with Anara and facilitates foul rituals, tears in the material plane, and other evil influences. The normal days of the week are as follows with Mornda being replaced with Lundus days on the 1st of month; Mornda, Teda, Mida, Turda, Freda, Loreda, and Suna. The months are as follows Morning Star, Solis'' Dawn, First Seed, Rain''s Hand, Second Seed, Midyear, Solis'' Height, Last Seed, Hearthfire, Frostfall, Solis'' Dusk, and Evening Star. Once every 20 years the Sea of Stars is visable from Anara and appears as a silvery sparkling mist in the night sky, otherwise the only source of light at night is from the pale light of Lundus. The current year and age is 4983 After Dark.The plane of Anara has undergone multiple significant events since its creation such as the war between the gods and primordial titans at the end of the Primordial Age and the Schism War and its resulting Dark Age. This unstable past has left numerous ruins scattered about Anara with many of them and their secrets lost to time.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Solis Sphere')
);

-- Anara Continents

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Acies',
        'Acies is located in the south of the western hemisphere (Acient) and is known for its relatively flat and open landscape, along with some of the oldest surviving structures on Anara. Acies is ruled by the Itamevoth Theocracy and its people heavily influenced by the worship of the good aligned gods of Anara. These religious beliefs have fueled the constant skirmishes and crusades since the Dark Age against the people of Krukiathu to the north who openly worship the dark gods. The continent is separeated into different Domus'' (houses) which all answer to the high church in Ziet. The most notable land marks are the Scalar Patha, The Luk''Teph Dessert, and the city Novum.',
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
        'Cinallis is located in the North of the Eastern hemisphere (Cinalent) and is known for its lush forests, wide and deep valleys, and the Cinallis Alps, a thick mountain range which nearly divides the continent in two. The continent contains three governments, the Doaverine Junta, Ghuzalterok Remnant and the Tamel Imperium. Cinallis was once mainly ruled my elven houses after the end of the Dark Age, but after years of hardship those races which have shorter lifespans rebelled against their venerable masters driving them to the north. This lead to the creation of the Doaverine Junta in the North and the Tamel Imperium in the South, which have had multiple wars since. In the West Marches an alliance of multiple kingdoms joined under the rule of Gandersheim and remained neutral parties to stay out of the conflict. But in 4742 After Dark, Ghuzalterok Remnant forces invaded the West Marches crushing Gandersheim alliances. This invasion drew the attention of the other two remaining governments on Cinallis ushering in a three way stalemate and cold war like temperments between the Doaverine Junta and Tamel Imperium. The lost forge of Bazzonad, the lost temple of Chorn Loith, the Cinallis Alps, the D''Larrawil Forest and the thin sliver of ice and land which lead to the Pale Wastes in the North make up Cinallis'' major landmarks.',
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
        'Glaciem is the southern ice cap on Anara, and is known for its barren fields of ice and a never ending blizzard that encompases most of the continent and hides a mountain range that encircles its center. This center area is not subject to the buffeting winds and snow fall and holds a crater with canyons splintering out from it. The blizzard known as the Eye of Anara has never been traversed successfully and is said to be filled with ghosts. Prior to the Schism War, Glaciem was home to the Sela''Teph Empire but all that remains are hidden ruins in the never ending storm and beneth the ice. The center of Glaciem was the site at which Veilith and Guhluk fought during the Schism War.',
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
        'Kurkiathu is located in the North of the Western hemisphere (Acient) and is known for its imposing mountain range and jungles in the south, along with a harsh barren landscape and thick mountain range in the North. The continent is ruled by The Ghuzalterok Remnant an oppressive and tyranical government which reveres the dark gods of The Schism War. The continent is separated into three zustands by this goverment; The Blas Zustand in the East, The Dunn Zustand in the North, and The Grun Zustand in the South. For centuries the people of Krukiathu have been in wars, skrimishes and crusades against the Acien people to the South. The most notable locations of Krukiathu are The Zult Spiel in Zult, The Scalar Patha, the crater created during The Banishment, and the lost temples of Eintra''Teph and Tenbraz.',
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
        'The Pale Wastes make up the Northern ice cap for Anara and are mostly a harsh and desolate tundra. A vast mountain range known as the Northwall Mountains nearly encircle the continent along its coast. Here many people still abide by the ways of life from the Dark Age which is localy known as the ''old way'' and makes for a harsh and brutal lifestyle. An ancient white dragon Balaroth claims dominion over the Pale Wastes, though it is in reality a lawless landscape where the Duergar of Lutzun and Giants of Dulrath often openly oppose him. Beyond the small strip of land that connects to Cinallis, the Pale Wastes contain Balaroth''s Peek and the ruins of Aiel The Thrown City localy known as ''Tarmstal'' (tombstones).',
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
        'Located in the South of the Eastern hemisphere (Cinalent) The Salted Tides are made up of a group of islands, some inhabited and some not. The creation of the Salted Tides actually occurred when Iyla cast the ancient continent of Pulchra into the sea, forming the islands from the highest mountains and regions of the former continent. The small communities of the islands are mostly separate from the rest of the plane and avoid outside influence. The islands of Red Water, Amunja, and Kaikyo each have their own ruling factions, while Teokalli is claimed by a blue dragon known as Uvarith ''The Furious'' and has constant storms in the area driving away sailing vessels. Prior to its destruction in the Schism War, Pulchra was home to the Serenus Semita (Serene Path) where Iyla''s worshipers would climb the tallest peak in Pulchra (present day Teokalli) and enter to complete their pilgrimage.',
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
        'Occupying the Southern portion of Cinallis the Tamel Imperium is known for its many vallies, rivers and dotted forests. This portion of Cinallis was originally ruled by two elven houses for about 2,000 years after the Dark Age. However, after a revolt from the less venerable races in the area the elves were driven into the North of the continent. Remnants of the old elven houses can often be found in the forested regions, especially in the thicker woods. The Tamel Imperium is known for its prosperous economy and heavily guarded borders and is broken up into the Tamel, Dirmil, Banewright and Deepstone kingdoms. The relations with The Doaverine Junta that emerged from the elven houses in the North is still tenuous leading to heated diplomatic relations which make crossing borders difficult. Additionally, the growing threat of Ghuzalterok Remnant forces in the West Marches has resulted in numerous skirmishes. The Tamel Imperium has avoided commiting large forces to the West Marches to both avoid starting a war with the junta in the North from percived hostile movements and to keep the borders safe in case the junta would start an invasion should the imperium commit such forces. Internally the Banewright and Dirmil kingdoms have a rivalry leading to political maneverings and manipulations, whilst the Deepstone Kingdom seeks to maintain what independence it has left from fall of the prior elven houses. The most notable locations in the Tamel Imperium include the Cinallis Alps which holds the ancient Terasu temple Chorn Loith near Halgarum, and Tamel the capital of the imperium which is a massive sprawling metropolis.',
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
        'Located on the South West side of Cinallis the West Marches is known for its banded woods and badlands. The former ruling faction the Gandersheim Alliance has been replaced by the Ghuzalterok Remnant after their invasion in 4742 After Dark. Remnant forces rule the area with an iron fist but some areas have either been abandonded or left as lawless wilderness. Remnant forces are regularly met in skirmishes with both The Doaverine Junta and The Tamel Imperium but both parties are reluctant to make any major move against Remnant Forces. Some of the original populace remain from before the invasion but most are held against their will or stay from fear of death if caught trying to escape. Other than the massive fortress of Gandersheim the most notable locations in the West Marches include the many ruins, war torn towns, Remnant fortifcations and Vak''Din Mog which serves as the headquaters for Remnant Forces.',
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
        'The Northern part of Cinallis is occupied by the Doaverine Junta an assembly of clans which chooses its ruler every 20 years and is known for its thick woods and cold climate. Originally the region was a lawless area inhabited by independent clans, barbarians and the wilderness but the escaping elven houses from the South at The Tamel Imperium''s founding gained rule over the region forming the junta that rules it today. The junta is split up into the Earrans (Woods); Clach in the East, Geal in the Center and Uaine in the West. Poor relations with the imperium persist to this day due to the past wars and clan members of the junta normally distrust outsiders. While worship of the gods is not outlawed people tend to follow druidic ways of life in the junta. The most notable locations in The Doaverine Junta are the great woods around D''Larrawil where trees tower into the sky and are sometimes home to whole communities, and the thin sliver of land that connects Cinallis to the Pale Wastes which is pocked with ice lakes.',
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
        'Red Water is a relatively small island in the Northern part of The Salted Tides run by a mafia like organization of pirates headed by The Red Admiral. Though there are few laws in Red Water, those that break them are harshly punished such as being fed to sharks. The pirates of red water regularly plunder ships in then area for supplies or valuables to sell to other entities, but remain relatively aligned so that they can mount a defence against larger governments that seek to put an end to their attacks. The island of Red Water is spotted with small encampents with towers to both spot vessels to attack and for defence.',
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
        'Located in the Southern area of the Salted Tides, Kaikyo is known for its 4 season weather, central mountain range and abundant fishing produce. The island is split North and South by the Genshi House and the Shianzong House which have always had a poor relationship.',
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
        'Located nearly in the center of The Salted Tides, Amunja is an inhabited island but is rarely traveled to due to its territorial communities. These two communities are separated by a volcanic mountain range and rarely interact. These people live a more druidic and tribal lifestyle rather than divine worship and often have leaders who are shamans.',
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
        'Located in the North East of The Salted Tides is the large island Teokalli. Despite its size only the blue dragon Uvarith ''The Furious'' and wildlife inhabit the island. The island and area around it are normally subject to large storms caused by Uvarith''s presence. Notably, Teokalli was the former sight of the tallest mountains in Pulchra prior to it being cast into the sea by Iyla during the Schism War and thus is home to the entrance of The Serenus Semita.',
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
        'Alu''Teph is a deserted island North of Kaikyo in the center of the salted tides that has fairly thick woods and the ruins of Alu''Teph an ancient highland planes society from the Primordial Age. Alu''Teph was destroyed as Pulchra was cast into the sea but it remained above sea level due to its altitude. While the island has mostly been reclaimed by nature the ruins still contain ghosts from a bygone age.',
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
        'Located in the North West of The Salted Tides Maoren is a relatively small island with some brush on its South side and large beaches on its Northern side. Though ruined during The Schism War as Pulchra was cast into the ocean Maoren was once a great port city for sea fairing elves. These ruins span a good portion of the Southern part of the island.',
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
        'House Genshi',
        'Located on the North side of Kaikyo, House Genshi is known for its fishing produce, coastal villages and loose adherence to Anara''s pantheon worship. While not at war with House Shianzong in the South, relations have been sour for centuries.',
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
        'House Shianzong',
        'Located on the South side of Kaikyo, House Shianzong is known for its colder climate, reliance on hunting in addition to fishing, and druidic practices. While not at war with House Genshi in the North, relations have been sour for centuries.',
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
        'Located on the Southern tip of Amunja, Ialistli is known for its heavy jungles. The Ialistli people live a tribal lifestyle and are quite territorial. While not on good terms with the other tribe in the North of the island Ialistli people tend to avoid outside contact. Worship of primordial spirits is the norm and knowledge of the gods of Anara is barely known and mostly dismissed.',
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
        'Located on the Northern side of Amunja, Tlapetlan has a fair bit of jungle but also some clearings and spacious shore lines. The people avoid outsiders, are fiercly territorial and worship primordial spirirts. In recent times however the people of Tlapetlan have been regularly offering up treasures and the like to Uvarith the blue dragoon that rules Teokali.',
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
        'Encompasing the Eastern portion of the Tamel Imperium the Dirmil Kingdom is known for its high produce output from its farms, other fine goods, and art which give the rest of the imperium much of its culture. This has instilled a sense of patriotism in many of the kingdom''s subjects leading to a poor relation ship with the Banewright kingdom in the West. The people are generally friendly and tend to partake in finer comforts, but classist believes can be found throughout the society.',
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
        'Located at the heart of the Tamel Imperium its kingdom is also ruled by the Emperor and is well known for its beautiful surrounding country side and the large Tamel Lake which sees many sea faring vessels navigate to from the sea. The Banewright and Dirmil kingdoms often attempt to play manipulative games to gain favor of the Tamel Kingdom''s nobles sometimes leading to tense political climates.',
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
        'Located on the Western side of the Tamel Imperium the Banewright Kingdom is right up against the West Marches. The Banewright Kingdom produces noteably less for the Tamel Imperium compared to the Dirmil Kingdom. However, the Banewright Kingdom is considered the ever vigilant bullwark of the imperium due to its location and these differences often lead to heated relationships between the two kingdoms. Here the people expect all to serve in the kingdoms military for atleast some period of time and there a strong values place upon military service and sacrifice. Due to the proximity of remnant forces and the clans in the North many of the kingdom''s people hold old grudges against Orcs, Tieflings and Elves.',
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
        'Formerly known as the Uskederth Kingdom prior to the Imperium''s founding the Deepstone Kingdom is located North of the Dirmil Kingdom in the Cinallis Alps that separate Cinallis in Northern and Southern regions. All of the large cities are mostly under ground with a large Dwarven population. Originally the Deepstone Kingdom was independent and cooexisted with the old elven houses. However, during much of the uprising against the elven houses the kingdom tried to remain nuetral. Eventually the elven houses were defeated but towards the end of the war the emerging Tamel Imperium chose to bring the dwarven kingdom under its rule rather than attempt an assualt on the nearly impenetrable fortress of Uskederth. To prove loyalty to the new imperium the kingdom was forced to change its name to Deepstone a common tongue translation of Uskederth. The kingdom still seeks to retain as much of its independence as possible but it still has a good relationship with the rest of the imperium.',
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
        'Coastal town East of Lendsberth, economically known for its trade and fishing ports but is more widely known for its lavish livelihoods, orchards, and art. Many more well of individuals of the Dirmil Kingdom often vacation here to take in the usually good weather and spacious coastlines.',
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
        'Lendsberth is the capital of the Dirmil Kingdom despite its name. While not nearly the size of the imperial capital the large city is placed atop a sizeable hill among a vast expanse of plains giving it a great view of the surrounding landscape while also adding to its image of size. Large amount of the imperium''s farming and produce output come from the surrounding areas of the city and the area is well known for its relative safety.',
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
        'Port Sod',
        'Port Sod is located South of Bruessix and Lendsberth and has a large amount of fish and trade come through through the port. The city is also known as the gateway to the Salted Tides and often times items from many items can be found on display or for sell here.',
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
        'Halgarum sits halfway up a mountain to the East of Deepstone where its dwarven creators dug into the mountain carving out a great cavern supported by massive pillars that hold up the top of the mountain. Though some buildings are found on the outside cliff side path to the gate they are very few in number compared to the rest of the city. To gain entry to the city travelers are required to pay for a lift ride up the side of the mountain if they have mounts and carts. Those travelers on foot are able to gain access for free if they take the old stairway. The more wealthy establishments are normally found carved into the sides of the pillars but the upper most portions and their connecting bridges are used almost exclusively by the guard and local authorities.',
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
        'Deepstone the capital of the dwarven kingdom in the Tamel Imperium can be found in the mountains North of Lendsberth. In combination with the fort Uskederth the city is said to be an impenetrable fortress. Even dragons are believed to be wary of it due to the dwarven ballista towers that line the main streets and walls. The city proper is half under ground of the surrounding mountains and the other half spanning the large valley between them like a bowl. The main keep however is carved into the side of the Northern mountain and goes deep underground. Beyond the city''s defences its citizens also pride themselves with some of the best mechanical enginers in the Tamel Imperium. The area surroudings the city is also rich in metals, attracting numerous mining companies.
',
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
        'Uskederth',
        'Though often times not considered to be seperate from the city of Deepstone, Uskederth easily stands on its own due to its defensive wall which towers into the air and is lined with the dwarven kingdom''s signature gimbal like ballista. The doors are towering peices of metal with the kingdom''s standard emblazend upon them. Travelers are able to reach Deepstone by way of a tunel that has its own set of defences. Some regular businesses and residents live on the protected side of the wall but mostly just support the garrison that lives in and behind the wall.',
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
        'Steel River',
        'Steel River started as an iron mine of considerable size and eventually became the large city it is today. The city still boasts a massive iron mine that goes very deep underground. Adventurers are often highered to clear out and or scout out new areas of the mine as it is continuously added to.',
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
        'Myrtis is located West of Deepstone in a valley and unlike the other cities of the Deepstone Kingdom, Myrtis is an above ground city. Some surrounding mountains have watch towers built into them but that is the main extent of the normal underground life style found in the kingdom. Myrtis while part of a mostly dwarven kingdom is much more diverse than the other cities and contains a fair amount of humans and elves. ',
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
        'Bruessix',
        'Often overlooked due to its rustic nature, Bruessix stands out as one of the safest places in the Tamel Imperium. The people hold the duke in high regard due to his faithful efforts towards his subjects. The Jannis orchard also produces one of the more desireable wines in the Tamel Kingdom.',
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
        'Ita',
        'Placed on the opposite side of the Tamel Lake from the imperium''s capital, Ita is surround by just as beautiful country side but is a fraction of the size of Tamel. The city has some ports that smaller vessles often dock at but it is really known for its great architecture like the captial city but without the metropolis feel.',
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
        'Gates Town',
        'Located on the Southern portion of the Tamel lake Gates Town is a city combined with an imperial fort. Nearly all of the shipments moving between the kingdoms comes trough this city and thus many travellers and merchants can be found here. It also doubles as one of the main fortifications in the Tamel Kingdom and is considered a key strategic asset.',
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
        'Located in the Cinallis Alps North of Tamel, Wellsfort is an imperium fort city placed there to both control the mountain borders and to take advantage of the natural resources in the mountains. The area around the fort has numerous mines and is known for its rich iron supplies. This has also brought a decent amount of smiths to the area but most of the output from the forges of Wellsfort come from smiths making arms for general soldiers. ',
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
        'Located at the center of the Tamel Imperium, the capital Tamel is a sprawling metropolis with massive surrounding white walls spoted with red imperial banners and an interior fort and layered castel complex with the imperial palace at its center. The city also has a large port within a section of wall that encompasses part of the Tamel Lake. The country side found around the city is well known for its beauty and the city itself has untold amount of stores and shops. The city even sports a colosseum where criminals and warriors fight for money, fame and freedom, often times to the death in the event criminals are pitted against each other. The cities wards are well segregated between the classes and the watch tower lined main streets are massive. The imperial Scriptorium''s headquarters can be found here along side the city''s lesser noble houses in the inner wards. Numerous small communities can also be found around the outside of the city''s walls.',
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
        'Tamsberth located South of Tamel is the main Tamel Imperium naval base. Trade also flows through the ports but they are mostly reserved for imperial vessels. Its location affords the imperium the ability to combat piracy from the Salted Tides while also acting as a naval launch point centered at the middle of the imperium. As such the city is home to many imperial sailors and is the main training area of the imperial navy.',
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
        'Tharkad sits on the Western most river of the imperium and holds the only crossing into the West Marches and is often known as the ''Aegis of the West'' within the Tamel Imperium, particularly in the Banewright Kingdom. Though the city mostly serves as a fort there are plentiful shops and businesses that have sprung up in its common areas to support the large military presence in the fort. The garrison and other forces are often engaged in skirmishes with the Ghuzalterok Remnent in the immediate Western areas but the Imperium refrains from any large troop movements in the area to prevent hostilities or raising tensions with the Doaverine Junta in the North. The city is often used as a staging point for bounty hunters and mercenaries that work out in the West Marches.',
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
        'Banesford the capital of the Banewright Kingdom is found West of Tamel and while mainly serving as a city its fortifications are well kept and made due to the placement of the kingdom between the imperium and its enemies. Its citizens are very patriotic and harbor rivalries with the Dirmil Kingdom in the East and due to their proximity with the Doaverine Junta and Ghuzalterok Remnant also hold deep grudges against elves, orcs, teiflings, and sometimes even dwarves. All people are expected to provide some stint of military service at some point in their lives. The area around the city is able to produce a decent amount but does not add to the imperium''s output much and is more well known for its faded landscape. ',
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
        'Located in the Southern portion of the Banewright Kingdom, Steinen doubles as a fishing port and forward operating base of the Imperial Navy against Ghuzalterok Remnant forces. Due to the city''s high rotation of ported ships docking often comes at a high price and ships are expected to use the least amount of time possible in the port. This has driven a high pace lifestyle onto its residents, and as such bartering is normally avoided and people can be quite blunt.',
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
        'Located towards the Western edge of the Cinallis Alps the 1st Pillar is a small imperial fort built to protect a tower that watches over the surrounding mountains and forest for invaders trying to cross imperial borders. The fort is quite secluded and is often used as a home to newer imperial soldiers to instill a fear of the old elven houses. The path to the fort goes through the Mithmirelen Woods where the hose of the same name used to rule from. New recruits are often exposed to the strange and haunted nature of the woods left by the old elven house and then left in isolation at the fort watching for invading clan members.',
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
        'Located towards the center of the Cinallis Alps the 2nd Pillar is a small imperial fort built to protect a tower that watches over the surrounding mountains and hills for invaders trying to cross imperial borders. ',
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
        'Located towards the center of the Cinallis Alps the 3rd Pillar is a small imperial fort built to protect a tower that watches over the surrounding mountains, hills and forests for invaders trying to cross imperial borders. The 3rd Pillar is often seen as an easy post or a post used for the latter days of a career due to its close proximity of various dwarven cities. 
',
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
        'Located towards the Eastern edge of the Cinallis Alps the 4th Pillar is a small imperial fort built to protect a tower that watches over the surrounding mountains, plains and nearby coast for invaders trying to cross imperial borders. Due to its close proximity to the Frillis Cartuae it is often seen as the most desirable post in imperial service.',
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
        'Hera',
        'Located just West of the 4th Pillar Hera is known as a nice quiet mountain side town in rolling hills.',
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
        'Crois',
        'Located just West of The Frillis Cartuae Crois is known for its country side of mixed trees, hills and flat land.',
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
        'Monas',
        'Located towards the center of the kingdom and just North East of Lendsberth, Monas is known for its various farms and frequent passing through travelers.',
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
        'Okens',
        'Located on the North side of the Thendanril Woods between Lendsberth and the 5th Pillar, Okens is a busy lumbering town feeding wood into to the kingdom.',
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
        'Kornith',
        'Located South of Lendsberth and at the North West side of the Thendanril Woods, Kornith is known for its quiet wooded atmosphere.',
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
        'Rueden',
        'Located North West of Lendsberth near the edge of the Millis Lake, Rueden is often seen as the stop gap between the Dirmil Kingdom and the Tamel Kingdom.',
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
        'Greenriver',
        'Located South West of Lendsberth built on top of one of the large river crossings, Greenriver is known for its inns along the side of the river and its vibrant but tasteful night life.',
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
        'Located East of Lendsberth the 5th Pillar is a small imperial fort built to protect a tower that watches over the surrounding forest, plains and nearby coast for invaders trying to cross imperial borders.',
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
        'Located South of Lendsberth the 6th Pillar is a small imperial fort built to protect a tower that watches over the surrounding forest, and nearby coast for invaders trying to cross imperial borders.',
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
        'Located South of Tamsberth on a small cape extending out from the continent the 7th Pillar is a small imperial fort built to protect a tower that watches over the small gulf of Tamsberth, and nearby coast for invaders trying to cross imperial borders as well as any pirate vessels from the Salted Tides.',
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
        'Loina',
        'Located on the Eastern river border of the kingdom North of Port Sod, Loina is built on top of the edge of the large river bridge and surround area and is known for its easy going and quiet populace.',
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
        'Piet',
        'Located just East of Gates Town Piet is known for its nearby woods and farming.',
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
        'Julis',
        'Located South of Gates Town on a large river crossing Julis is known for its river fishing and fortifications to the nearby bridge to help control the flow of naval vessels up the Tamel River.',
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
        'Rhoane',
        'Located just South of Wellsfort, Rhoane is regularly visted by Tamel Imperium soldiers on leave from the nearby fort and thus sports a reasonably sized community.',
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
        'Madri',
        'Located just North East of Tamel, Madri is known for its hunting and fishing along with people from Tamel trying to get away from the city for some time.',
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
        'Barsis',
        'Located just North of Tamel, Barsis is known for its hunting and nobles will often frequent the town to launch hunting parties into the woods.',
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
        'Safea',
        'Located between Tamel and the 1st Pillar, Safea is known as the last stop before entering the Mithmirelen woods and the populace often tells stories about the those seemingly haunted woods.',
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
        'Azris',
        'Located just South of Gates Town, Azris is hardly a day away. Soldiers often take leave from the nearby fort town and go to Azris where they find peaceful fishing along the nearby Tamel River.',
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
        'Velia',
        'Located just South of Tamel, Velia is known for its farming and flatland along with goods passing through North and South.',
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
        'Aer',
        'Located just South West of Tamel, Aer is known for its small nearby lake and surrounding wetlands. Aer is also the only town connecting the Banewright Kingdom and Tamel Kingdom on the Northen and central borders.',
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
        'Cleo',
        'Located between Tamel and Tamsberth, Cleo is a crossroads town with a fair amount of goods passing North and South between the capital and nearby port.',
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
        'Brint',
        'Located North of Tamsberth, Brint sits on the edge of a small wood where some lumbering and hunting takes place along side the passing shipments of goods between Tamsberth and Tamel.',
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
        'Damas',
        'Located North East of Tamsberth near the outlet of the Tamel River, Damas has a few ports for ships entering the large Tamel river but the town actually rarely gets travelers by land or sea and mostly fishes from the river while hailing the passing naval vessels.',
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
        'Stola',
        'Located West of Tamsberth on the Western river border between the Tamel Kingdom and the Banewright Kingdom, Stola serves as a stop gap on the Southern side of this border though does not see as many travelers pass through compared to Aer to the North.',
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
        'Located on the Southern coast of the Banewright Kingdom the 8th Pillar is a small imperial fort built to protect a tower that watches over the nearby plains, and coast for invaders trying to cross imperial borders.',
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
        'Gandel',
        'Located North of Banesford, Gandel is a small riverside town with patches of woods around it. The town though is largely out of the way of normal travelers.',
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
        'Bellon',
        'Located South of Banesford, and surrounded by mostly flatland, Bellon is the main source of crops within the kingdom.',
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
        'Shollik',
        'Shollik is located along the central Eastern river border between the Banewright Kingdom and the Tamel Kingdom but has no river crossing. As such not many people stop in the town unless they need to divert from the main road to Banesford for supplies or some other emergency. The town mostly provides some riverside fishing and farming for the kingdom.',
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
        'Melsward',
        'Located just South of the 9th Pillar, Melsward is large out of the way for many travelers but the town prides itself in adding to the defence of the Western border. The town is lightly fortified and regularly has Banewright soldiers stationed to watch the river and assist the nearby pillar in thwarting any attacks in the area.',
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
        'Located on the Southern edge of the West Marches border the 9th Pillar is a small imperial fort built to protect a tower that watches over the nearby plains, and river for invaders trying to cross imperial borders. Heavy amounts of imperial patrols can be found along this border from the 9th Pillar to Tharkad.',
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
        'Located South of Tharkad along the the West Marches border the 10th Pillar is a small imperial fort built to protect a tower that watches over the nearby plains, and river for invaders trying to cross imperial borders. Heavy amounts of imperial patrols can be found along this border from the 9th Pillar to Tharkad.',
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
        'Venningen is located just on the otherside of the Tamel Imperium Western border and still harbords a decent amount of order to its governship despite being located in the West Marches. Though independent the city regularly feeds the imperials at Tharkad any information they can obtain on both the Ghuzalterok Remnent and Doaverine Junta forces in the area. In return the Tamel Imperium has been known to come to the aid of the city when threatened. Despite this the city is still a good place for those trying to stay clear of the imperium and thus is home to some of the West Marches'' ''less'' shady individuals.',
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
        'Henreith is located in between The Ghuzalterok Remnant and two other major powers on the Cinallis continent. Once known for its surrounding fields, hills, and trees it is a shell of its former self, reduced to ruins by years of fighting between the various powers in the region. Henreith holds no population and is only known as a combat zone when the various skirmishes take place in the West Marches, otherwise it is a ghost town. ',
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
        'Placed along the Southern portion of The Ghuzalterok Remnant front lines Zu''Wart is a small fort used to both gather forces for offensive operations and to maintain the foothold of forces in the area. The surrounding forests are subject to heavy patrols.',
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
        'Karlshad was once a peaceful and prosperous lakeside town located on the South side of the West Marches. After the Ghuzalterok Remnant forces gain power over the region the people were force to provide large tithes forcing many of the people who lived there into poverty. One day a local had managed to steal a particular book from the passing through remnant captain at the time. This book had writing which the local could not understand but due to the remnants intrest in it they took it and managed to do so with out being caught. However, after the remnant forces realized the book was gone they returned to the town nearly razing it to the ground and killing most of its population. Some managed to escape into the nearby woods where they either made their way North, East or died along the way. Those who remained in the town were subjected to hard larbor, torture and interagations. Presently there is still a lingering population that continues to present tithes to remnant forces, but they do so out of fear. If they were to be caught trying to cross out of the forest to the East they would be killed on sight and remnant vessels have destroyed whatever small low quality boats the population has tried to escape with out the lakes mouth to the South.',
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
        'Gandersheim is located on the Northern edge of the West Marches along the coast of a small gulf and was once the home of the Gandersheim Alliance. Home to a massive fort it is used as the forward operating base of the Ghuzalterok Remnant in the region. The surrounding town is still populated with some if its former citizens but they are held against their will and the town is subjected to large patrols of remnant forces. Any who attempt to escape are either killed or dragged back to the city where they are brutally punished in public.',
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
        'Located towards the Northern part of the Ghuzalterok Remnant front lines Nir''Wart has often been the launching point for many raids going into Henreith. Its garrison also heavily patrols the surrounding forest.',
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
        'Vak''Din Mort is located almost exactly in the center of the West Marches and serves as the backbone for Ghuzalterok Remnant forces which use the forest in the West Marches as a defensive line. Beyond serving as a crossroads between other parts of remnant controled territory, Vak''Din Mort also has supply depos, smiths and a relatively large surrounding community of remnant citizens.',
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
        'Immenreuth is located just West of Gandersheim on the North coast of the West Marches. Once home to one of the elven kingdoms in the area but during the invasion of Ghuzalterok Remnant forces the city was reduced to mostly ruins. Remnant forces now use the area as a undead spawning ground and haul any corpses from local combat here to be raised as undead forces. Due to the cool ocean air from the North and the mountains South of the city the surrounding forests are often filled with fog and mists after dawn.',
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
        'Annveild is a former underground dwarven kingdom located along the Northern coast of the West Marches. The city is entirely undergroundwith its entrances found in the forests around the mountains it is build under. A large number of caverns and tunnels form and almost maze like structure to the city but with a large central area that actually denotes the main city. Overthrown during the Ghuzalterok Remnant invasion the city is now home to many of the remnant''s drow forces in the West Marches, of which have created passages to tunnels all along the forest to the South and these have spawned some small caverns which house yet more remnant.',
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
        'Wussow is located along the Northern coast of the West Marches and is placed in a small clearing of the surrounding trees and mountains. Once known for its peaceful and easy going people it is now subject to the iron fist of the Ghuzalterok Remnant. Due to the close proximity of other Remnant strongholds the captive citizens rarely ever make attempts to escape and endure hard labor, conscription and abduction force on them by the remnant.',
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
        'Once known as the "Castle Under the Mountain", Ziegelheim is located towards the center of the West Marches and is located deep under one of the larges mountains in the region. The city sports impressive defences and walled off tunnels filled with seige weaponry leading down to the city. The city itself is located in an extremly large cavern with public areas surrounding a castle that gradualy rises up almost resembling the mountain it is under. The city was overthrown during the Ghuzalterok Remnant invasion and is now home to large amounts of duergar. The city serves as the main forges for the remnant forces in the area.',
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
        'Illan is located on the Southern side of the West Marches at the end of the spoted mountain range that separates the coastal areas from the large central forest. Once a human city among the rolling badland like hills the ruins of the city are now home to whatever Ghuzalterok Remnant forces that are heading East towards the front lines of the various skirmishes in region. ',
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
        'Located on the Northern coast of the West Marches in a small section of forest Errenthel is another one of the former elven kingdoms that met its demise during the Ghuzalterok Remnant invasion. Once a beautiful coastal elven town mixed amoung the trees the city now lies in ruins and abandoned.',
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
        'Vak''Din Mog is located on the Western coast of the West Marches and is Headquarters to the Ghuzalterok Remnant in the region. Despite being located in a desert like region the city''s ports pull in a large amount of resources from Krukiathu and remnant raiding vessels. The city is heavily fortified and is flanked by two large towers.',
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
        'Narenel is located on the South Western coast of the West Marches and was once a prosperous and peaceful coast town of mostly humans. During the Ghuzalterok Remnant invasion the city was ruined but the remnant have built up a fort along side the ruins of the city which they use as an auxillary port for supplies, troop movements and naval operations.',
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
        'Earrann Uaine (Verdent Wood) is located on the Western side of the Doaverine Junta and holds a border with the West Marches. This forest border is heavily patrolled by the clans of the junta. The rest of the region is dominated by open wilderness, hills, spotted trees, smaller towns and Mac''Tire its only major clan. The people of this region are highly territorial when it comes to the boarder and crossing can be perilous or if stopped it is not uncommon to be turned back.',
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
        'Earrann Geal (Jade Wood) is located in the center of the Doaverine Junta and holds the junta''s Capital Doaverhim. Spanning the from the center to the North of Cinallis this region has fair temperatures in the South and cold temperatures in the North. There are two major forests and a few major clans along with the junta''s capital Doaverhim.',
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
        'Earrann Clach (Stone Wood) is located on the Eastern side of the Doaverine Junta and harbors most of the countries dwarven population with its 3 dwarven cities. There are other clans beyond the dwarven led ones in the region but they have settled in the region''s forest or along its icy coast. In addition, this region has a small strip of ice and spotted snow covered islands that connect it to the Pale Wastes in the North. Some have ventured across it but it is normally seen as a worthless endevor due to the perils of the crossing and the numerous barbarian tribes and other dangers in the Pale Wastes.',
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
        'Grain is located along the North coast of Cinallis is home to one of the more independent clans of the Doaverine Junta. Grain is mostly known for its fishing in the cold waters towards the mouth of the Northwall Gulf.',
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
        'Mac''Tire is located on the Eastern edge of the Earran Uaine. The surrounding area is known for its large hills and spotted woods. Clan Mac''Tire is highly territorial and places high priority on keeping the borders secure to the South. People of Mac''Tire are also known for often conducting raids on the Ghuzalterok Remnant forces in the West Marches, sometimes with no appearent objectives.',
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
        'Giliad sits just on the other side of the large forest that forms the border between the Doaverine Junta and the West Marches. Rather than a city it performs more as a fort with some citizenry. The fort garrison and nearby Mac''Tire clan members strictly enforce passage across the forest border, which is often times considered dangerous by non clan members. There are no attack on sight orders but junta forces often will attack if there is suspicion that they have encountered remnant forces. Along with the fort is a forward watch tower in the forest which is used to raise alarm at the sight of large incoming forces.',
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
        'Gaeld',
        'Located on the central Western shore of the Earrann, Gaeld is a quiet fishing town but due to their proximity to the West Marches the citizens are highly sceptical of any travelers.',
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
        'Tornda',
        'Located on the North Western shore of the Earrann, Tornda is known for its nearby coastline that the town overlooks and the nearby hills. However, the town is not frequented by travelers.',
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
        'Bruchladen',
        'Located at the center of the Earrann, Bruchladen is a crossroads town for people who are traveling within the Earrann. The surrounding area is mostly flat land with spotted trees and hills.',
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
        'Taliskar',
        'Located at the Norther border of the Earrann, Taliskar is known for its cold river fishing and whisky distillary.',
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
        'Fidach',
        'Located at the Eastern boarder of the Earrann towards the Cinallis Alps, Fidach is a bustling river town which often gets used as a stoping point when entering or exiting the Earrann.',
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
        'Lophraid',
        'Located on an Island of the Western coast of the Earrann, Lophraid is known for its isolated druidic practices and town structure that incorparates most of the island''s mountain.',
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
        'Nathair is located along the central Northern cost of Cinallis though not as remote as Grain, Nathair still holds a certain level of independence due to is location. Its population takes part both in fishing and hunting in the nearby woods.',
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
        'D''Larrawil is located towards the Center of the Doaverine Junta on the Eastern side of a large lake and is placed in a very thick forest. Some of the surrounding trees trunks are as wide as 30 or 40 feet and are known to house small bridge connected communities. D''Larrawil was not one of the origial elven houses from the Southern part of Cinallis but came about as those houses fled North from the Tamel rebellion, as such the city''s populace is mostly elven.',
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
        'Cladach',
        'Located on the Western shore of the Earrann, Cladach like most other cost side towns participates in a good amount of fishing. Most of the immediate area around the town is flat tundra which gives ways to the spotted trees that dominate most of the Earrann.',
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
        'Bathan',
        'Located on the North shore of the Earrann between Grain and Nathair, Bathan is surrounded by spoted trees and a steep ridge costline which prevents any large amount of fishing. Most travelers are passing between Grain and Nathair which prevents the town from becoming to remote.',
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
        'Lin',
        'Located in the center of the Western landmass of the Earrann, Lin is a crossroads town with many travelers passing through from all sorts of clans in the area. The town is able to produce some crops during the warmer months but regularly hunts the nearby woods.',
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
        'Tigleann',
        'Located between D''Larrawil and the Cinallis Alps, Tigleann is regularly stoped at by travelers entering the Earrann or even the junta for the first time due to the fairer roads and weather. The town produces a good amount of crops from the surrounding land is known to be one of the more welcoming places in the junta.',
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
        'Tri''Doigh',
        'Located on the Eastern Earrann boarder near a large river fork, Tri''Doigh is one of the more traditional towns in the junta where drudic practices are favored over deity worship. Most of the few surviving refugees from Av''Naturen ended up settling here.',
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
        'Oir',
        'Located East of Doaverhim, Oir is a frosty crossroads town boardering the nearby forest. Heavily influenced by Clan Mithmirelen the town does not take kindly to non clan members.',
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
        'Sealladh',
        'Located on the North East shore of the Earrann, Sealladh is heavy secluded do the coast line with its freezing waters, the mountains to the South East and the thick woods with frozen marshes to the South West. Few people travel to the town due to the surrounding terrain.',
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
        'Av''Naturen is located on the Northern central side of the Cinallis Alps and is known for its strong ties to both Inaru and primordial elements. Originally the cities population was mostly Genasi, however, in 4977 the city was ransacked by a large force posing as devout followers of Inaru leaving the city mostly a ghost town. The city has since rebuilt and it''s population increased but remains from this attack are readily appearent. Many of the locals believe that the Tamel Imperium had perpetrated the attack, further fueling the long held grudges between the two countries.',
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
        'Ur''Mithmirelen is located in the Northern forest of the Doaverine Junta and is home to the former house of Mithmirelen from the Tamel rebellion. Despite the close proximity to other cities the clan has purposefully secluded themselves into the wood and do not maintain roads going through the forest. People may freely come and go as the please but its citizens often prefer isolation. ',
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
        'Doaverhim is located in the Northern central area of the Doaverine Junta and serves as the country''s capital. The local area is realatively close to the two major forests but the city mostly operates as a crossroad, in addition to the junta''s capital. Every 20 years the junta will choose a new jarl to rule from this city and each clan maintains representatives to advocate for their clan to the jarl.',
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
        'Iomair is located in the North Eastern mountains of the Doaverine Junta and right next to the strip of ice and snow islands that connect Cinallis to the Pale Wastes. Iomair''s population is mostly dwarven but surprisingly open to outsiders. The founding dwarves have dug this city deep under the mountains above to retain heat and stave off the freezing temperatures in winter. Some hunting of the surrounding area takes place but a lot of the city''s food comes from underground resources.',
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
        'Iolaire is located halfway up the Eastern coast of the Doavering Junta and despite its size actually regularly serves as the junta''s main port, even some Tamel Imperium merchants have regularly used the port for trade. The area surrounding the city is entirely made up of flat tundra spotted with trees.',
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
        'Stal is located in the central mountain range of the Doaverine Junta. This dwarven city is well known for its hunts in the seasons prior to snow fall to stock up on foods for the winter in the surrounding forest and mountains.',
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
        'Ur''Thendanril is located just inland along the Eastern coast of the Doaverine Junta North of the Cinallis Alps. This city is where the evlen house Thendanril settled after the Tamel rebellion. The clan is ot nearlly as isolationist as the Ur''Mithmirelen clan but still sticks to their old evlen traditions of building non invasive cities in the forest.',
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
        'Orn is located along the North Eastern edge of the Cinallis Alps and actually predates the formation of the Doaverine Junta. In the past Orn had a close relationship with the dwarves of Deepstone (known as Uskederth at the time) but has since cut off ties after the Tamel Rebellion. The dwarves of Orn hold great pride for their smithing and weapons, armor or other metal goods from Orn are well known in the junta. Much of the minerals and metals used by the city''s forges come from the mineral rich Cinallis Alps.',
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
        'Skye',
        'Located of the Eastern shore of the Earrann, Skye is kown as the most scenic location in the junta with its small mountain range, woods and large beaches which form a small cove on the Eastern side of the island.',
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
        'Daol',
        'Located on the Eastern shore line North of Iolaire, Daol is the most remote town in the junta, few crops are produced to the cold and thus the town does not get hardly any travelers, even for shipping.',
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
        'Shteach',
        'Located at the center of a forest West of Ur''Thendanril, Shteach is known for its wooded atmosphere and hunting.',
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
        'Tarsainn',
        'Located between Stal and Iomair, Tarsainn is a bridge city town where travelers often stop for rest. Most of the area around the town is flatland but quickly turns to hills to the North and South.',
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
        'The Scalar Domus (House of Blood) contains the Western part of Acies up until the major river West of Ziet. Though not all cities play a large role in the defence of the wall that guards the strip of land between Acies and Krukiathu the domus is known for its heavy commitment in the protection of the Itamevoth Theocracy. The region is dominated by a central mountain range, temperate envrionments in the North and more lush ones in the South.',
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
        'The Scutum Domus (House of Shields) contains the central part of Acies, from the border of the Scalar Domus to the West, until the Eastern river and mountains that separate Acies into two asymetrical land masses. This region contains two of the Itamevoth Theocracy major cities, one of which is Ziet the country''s capital. The Northern part of the region is almost all desert and the Southern portion has 3 mountain ranges with temperate climats.',
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
        'The Frigus Domus region contains the Eastern and island portions of the junta. In addition, the region also contains old elven cities and frozen areas in its Southern portions along
with a small group of islands in the Acien Sea.',
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
        'Kaled is located right on the edge of the Scalar Patha a strip of land that connects Krukiathu and Acies. Kaled is well known and revered for its massive wall and fortifications that have endured Ghuzalterok Remnant assaults for centuries. Though the fort serves as a first line of defence from remnant invasion, most of the surrounding area is occupied by civilian towns looking to support the large military presence. The walls are also said to be the starting point of The First Crusade which marked the end of the Dark Age.',
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
        'Bellum is located on the Western coast of Acies and is surrounded by flat land of spotted trees. The city is relatively well fortified for an average town but is more well known for its large part in naval operations against the Ghuzalterok Remnant in the Tantum Ocean. Due to the city''s close proximity to Krukiathu its ports are not really used for trade.',
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
        'Lacus is located on the edge of a large lake in the South West side of Acies. Lacus is one of the more peaceful places on Acies and is known for its large lakeside temple to Iyla.',
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
        'Haman',
        'Located south of Lacus on the Southern shore line of Acies, Hamas is a remote and easy going town surrounded by thin groups of trees and relatively flat land.',
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
        'Xerci',
        'Located East of Bullum along the main road to the Scalar Patha, Xerci is the last stop until reaching the great fortress wall city. Large amounts of travelers and goods pass through the town. The townsfolk make great effort to send off the soldiers before they leave town.',
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
        'Xallan',
        'Located North of Vita Nova along the mountains and a river, Xallan is blessed by bueatiful scenery but despite being somewhat out of the way the people of the town stay busy with various activities like mining, fishing, and farming in the surrounding areas.',
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
        'Vita Nova is located on the Southern coast of Acies placed in an reaf like alcove of coastline. Vita Nova has the most active trade port on Acies and merchants flock from all over to sell their wares and enjoy the cove''s coastline. This has led the city to be one of the most vibrant cultural places on Acies (a stark contrast to the usual church led militaristic life style) and many people come to take part in many of the festivals which are used to honor the gods. ',
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
        'Located in the center of the Dessert of Glass (aka. The Luk''Teph Dessert) is the former city of Luk''Teph. According to the few remaining records from the Schism War, Luk''Teph and the surrounding area used to be a lush area with rolling hills. However, due to some unknown event during the war the green hills were burned away and replaced with a dessert with a glass floor under the numerous sand dunes. Many of the former trees from the area still remain petrified and few people ever try to cross the dessert. Luk''Teph itself is now but a mass of ruins haunted by angery spirits that prey on all who enter the former city. As such all but the most brave treasure hunters avoid the area due its dangers.',
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
        'Located at the center of Acies in the middle of a set of mountain ranges, Ziet is both the capital of the Itamevoth Theocracy and one of the very few cities that survived the Schism War. Though many parts of the city were destroyed it has since been rebuilt and is now home to the largest and most elaborate cathedrals. Daily life heavily revolves around worship and service to the defence of Acies.',
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
        'Iter',
        'Located just North of Ziet, Iter is known for its mix of farming, shipping and travellers, though it is not as lively as Xerci when it comes to troop send offs on the way to Kaled.',
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
        'Faria',
        'Located on the Southern shore of Acies East of Vita Nova, Faria is a sizeable fishing town positioned on a small outcroping of land. Due to the towns location however it does not recieve many travellers. The people of Faria are very traditional and mostly untouched by outside influences.',
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
        'Hiatus',
        'Located South East of Novum, Hiatus is seen as a stop gap along the way to the Frigus Domus to the East. Large amounts of crops pass through from Mazra in the East in addition to the crops and fish the town itself provides.',
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
        'Musa',
        'Located North East of Novum, Musa serves as a stop between cities in the Northern part of the Frigus Domus and the Western parts of Acies. Fair amounts of goods such as lumber pass through the town in addition to its farming of the surrounding flat land.',
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
        'Calsahra',
        'Located East of Mulad, Calsahra is a well fortified port city that often takes part in naval operations against the Guzalterok forces to the North.',
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
        'Mulad is located on the Eastern side of the Luk''Teph Dessert around a large oasis like lake. The city itself is wholy commited to the theocracy''s cause but the harshness of the surrounding dessert has made the city somewhat isolated and many of the less savory types in the Itamevoth Theocracy often come to Mulad to remain unseen. But this lawless nature of the city has made it a good spot to go when looking for lucrative deals.',
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
        'Novum is located just East of Ziet and is a new city built in the place where Aiel once stood. Ledgends say that during the Schism War Rathak ripped Aiel from the ground and threw it across the plane of Anara. This left a crater with some of the few remaining pieces of Aiel. After the end of the Dark Age the city was refounded under the name Novum and is built down into the crater and into the crater''s walls. Some of the former city''s structures which went underground can still be found and have produced astounding artifacts despite their dangers.',
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
        'Amnis is located in the North East of Acies along a lake and its mouth that exits into the Rima Ocean. Mostly just seen as a stop gap when heading East, Amnis has never really been reguarded as a significant location. As such the population normally just goes about their business without much reguard to the Itamevoth Theocracy''s normal way of busy labor and worship. ',
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
        'Ormel is located in the North East of Acies at the center of a thick forest. The city is known for its heavy elven influences and large elven population. Rather than clearing out a area of forest the city is built in such a way to reduce its interference with it''s surrounding environment. While this make traversing the city take much more time it also gives it a certain level of natural beauty.',
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
        'Yamal',
        'Located North East of Ormel, Yamal sits on the North Eastern tip of Acies and serves as a base of naval operations and watch point for Ghuzalterok ships heading East. The town is well fortified and mostly surrounded by water.',
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
        'Edom',
        'Located South of Ormel along the Eastern coast line of Acies, Edom has the starting of forests to the North and flatland to the South. The town has some defences to protect itself from attack but is mostly known as a quiet beach town.',
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
        'Nahir',
        'Located North of Sharm, Nahir is situated against a river to the North and mountains to the West. The town is sometimes stopped at by travelers but is more well known for its mining conducted in the nearby mountains.',
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
        'Parid',
        'Located East of Astad, Parid is a remote town that survives of the nearby woods and shoreline. Many people will go out to Parid to disappear and though there are plenty of devout citizens, there is a large amount of people who do not conform to the Theocracy''s ideals.',
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
        'Sharm is located on the central Southern coast of Acies at the mouth of a small gulf. The city is known for its small town nature despite its relatively large size. The city relies heavily on fishing from the nearby gulf and Acien Sea.',
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
        'Mazra is located in the center of a large span of plains on the East side of Acies. The city is well known for its web like crossroads and large crop production output. The surrounding areas are heavily farmed leading to days of travel through farmland before reaching the city.',
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
        'Sahil is located halfway down the Eastern coast of Acies on the edge of a small inlet of water. The city may seem out of the way from the rest of the Itamevoth Theocracy''s major military installations but Sahil is in fact a major naval base for the theocracy. The city''s navy is in charge of securing the waters to the North and East of Acies leading to numerous engagements with Ghuzalterok Remnant forces. To support these operations a large portion of the gulf was dug up to the ports of the city to allow large naval vessels the ability to dock.',
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
        'Jaal is located just inland of the Southern cape of Acies along the coast of the Acien Sea. Like most Dwarven cities Jaal is located under the mountains and has a large network of areas. The surrounding mountains are also well known to have rich black silver deposites along with other metals. This has lead to a large density of mines in the area.',
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
        'Villam is located on the South side of the Eastern Acies coast. Rather than Itamevoth Theocracy naval vessels the city is more well known for trade coming through the ports. Tamel Imperium merchants bave enough to pass over the Rima Ocean and most of the trade from the Salted Tides comes through Villam. Unlike Vita Nova however the people of the city are much more utilitarian and focus on getting ships in and out so that Sahil to the North can be assisted should the need arise.',
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
        'Astad is located on the Southern tip of the Acien Sea coast line on of the more harsh climated areas of the Itamevoth Theocracy. The city does its fair share of both fishing and hunting in the surrounding area. For the theocracy Astad is the main naval vessel production ground and thus much of the city''s businesses revolve around contributing to the production of ships. Supplies are normally provided by the nearby forested area and the mines around Jaal.',
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
        'Jazir is located on the North West island in the Acien Sea. This isolation has fueled a certain level of independance from the regular Itamevoth Theocracy church teachings. It would not be unheard of to hear of druidic circles and worship in the area. The city regularly fishes from the Acien Sea but trade is a rarity for Jazir. Most people here prefer their private lives and are not so welcoming to strangers.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Frigus Domus')
);


-- Krukiathu Sub Locations (regions = 'Zustand')
INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Grun Zustand',
        'Grun Zustand is the region that encompasses the Southern jungled portion of Krukiathu until the end of its southern coastal mountain range. The areas jungles and mountains are heavily guarded by Ghuzalterok Remnant forces.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Krukiathu')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Blas Zustand',
        'The Blas Zustand region is located on the Eastern side of Krukiathu and is made up of some forests, mountains and dessert areas.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Krukiathu')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Dunn Zustand',
        'Dunn Zustand is the Northern region of Krukiathu filled with badlands, marshes and a dence volcanic mountain range. Without knowning where to look for food the area is nearly inhospitable.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Krukiathu')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Bok''Da',
        'Bok''Da is located just West of the Scalar Patha along the Krukiathu coast. The city serves as a major naval facility for Ghuzalterok Remnant forces. The city has a mostly Orc and Goblin based community and this is reflected in their regular raiding of the coast lines to the South of Bak''Da.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Grun Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Gol',
        'Gol is a massive wall like fort that extends across the Scalar Patha''s enterance onto Krukiathu. The fort is known for its ominous black walls and well fortified battlements. The Ghuzalterok Remnant keep a massive garrision stationed at the fort which is even carved into some of the nearby moutains.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Grun Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Ostanovka',
        'Ostanovka is located inland North of the Scalar Patha on the North edge of a large lake that runs into the straight that separated Acies and Krukiathu. The city is well fortified and regularly deploys military vessels into the straight to provide support on the Scalar Patha or to deal with any threats lingering in the straight. The city largely considers itself to be the second line of defence after Gol to the South. Due to the reduced level of trees around the city and its surounding country side the city also produces a fair amount for the Ghuzalterok Remnant. This combonation of duties has made the city quite lively with its citizens always having something to do.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Grun Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Ghux''Rok',
        'Ghux''Rok is located North of the Scalar Patha along the edge of a river. The area is mostly overlooked having fallen into ruin after being attacked by Itamevoth Theocracy forces during one of the many crusades over the centuries. The city was never rebuilt and is believed to have been scavenged for all that it had.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Grun Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Tenoklaten',
        'Tenoklaten is located right in the center of the major jungle that encompasses the Southern portion of Kurkiathu. Tenoklaten was once a city built by drow to cover from the sky under the dence forest ceiling during the mythic ages. However, during the Schism War the city was ruined and left in rubble leaving behind spirits which now haunt the area. Ghuzalterok Remnant forces even avoid the ruins and either hastily pass through during daylight hours or take paths around the former city.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Grun Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Gharr''Gak',
        'Gharr''Gak is located on the Southern coast of Krukiathu just East of the Scalar Patha. The surrounding area is either dense jungle like forest or dense mountains. Gharr''Gak is used as a base of operations to thwart attacks that would seek to cross over the Southern mountain range of Krukiathu. The city sports a large fort and is surrounded by a community dominated by Orcs and Goblinoids. The garrsion is regularly tasked with patrolling the Southern mountain range.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Grun Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Brak',
        'Located West of Ostanovka, Brak is a town along the North side of the Kruth Jungle and assists in watching its Northern border. Additionally, the  town serves as a stopping point for shippments and travelers going South from the Western shore of Krukiathu.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Grun Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Gorm',
        'Located North West of Jhilak, Gorm is a crossroads town that attempts to make use of its surrounding land for farming as best it can.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Grun Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Jhilak',
        'Jhilak is located on the North side of a large lake in Southern Krukiathu. Jhilak has a fort but is more along the lines of a regular Orc and Goblinoid village. The city heavily fishes out of the lake to the South so it has a decent amount of ports for small vessels.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Grun Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Ighagh',
        'Ighagh is located on the Southern coast of Krukiathu placed in the center of the North side of the coastal mountain range. The land mass that Ighagh is on is surrounded by large rivers and a lake making for an isolated section of thick forest like jungle. Ighagh is tasked with patrolling the mountains to the South and maintaining control of the land mass it is on. Its fort is of resonable size and is surrounded by Orc and Goblinoid communities.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Grun Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Krepost',
        'Krepost is located at the Eastern end of the Southern Kurkiathu coastal mountain range at the entrance to a small gulf. The area around Krepost is comprised of a wide variety of land and water with forests, mountains, and coastline. Though the city is located on the coast it hardly uses its ports for fishing or trade due to the close proximity of Acies to the South. The ports instead are regularly used as repair or productin yards for Ghuzalterok Remnant forces.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Blas Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Beheerla''Teph',
        'Beheerla''Teph is located in the East of Krukiathu between two small mountain ranges and at the center of a forest. Beheerla''Teph is a Drow dominated city where the populace take cover from Solis under trees of the thick forest. The city also has a large underground portion to it which often unknowingly adds to the city''s size.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Blas Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Lezna',
        'Located West of Beheerla''Teph, Lezna is a forest side town serving as a crossroads in and out of the Blas Zustand. The town also provides some crops and game from the local farmland and forest hunts.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Blas Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Zaliv',
        'Located South West of Beheerla''Teph, Zaliv is placed between moutains and forests at the end of a small gulf. The town provides a mixture of mining, farming, and hunting but is more well known for its ports that provide aid to Ghulzalterok Forces.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Blas Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Tlatelok',
        'Tlatelok is located on the North East coast of Krukiathu North of the Blas Zustand''s major forest. The surrouding landscape is spotted with hills but beyond that not much is found. At the center Tlatelok lies a massive temple to Ghuluk where countless undead are raised to work in the ports of the city. Since the population of the city is mostly undead the surrounding lands are not heavily farmed and the ports are used for ship production. Undead slaves are used to build ships day and night without end leading to a steady output of vessels for the Ghuzalterok Remnant navy.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Blas Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Iztapham',
        'Iztapham is located on the East coast of Krukaithu on the North side of its barren coastline. Iztapham is now a pile of ruins left from the Mythic Age where elementals and ghosts roam. The city was once a ruled by primordial worshipers but was destroyed during the Schism Age by Ghuzalterok forces. Treasure hunters and mercenaries can often be found braving the depths of the old ruins to obtain what ever artifacts they may be able to find but average folk avoid the area due to its dangers.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Blas Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Addun',
        'Addun is located on the South East tip of Krukiathu well into the coastal dessert of the Blas Zustand. The city is spanned across a large portion of the coast and is loaded with ports for naval vessels. The Ghuzalterok Remnant use Addun as the forward operating naval base in the Rima Ocean. The it is said that the city does not rely on food from in land Krukiathu but rather on raiding spoils alone. Vessels from Addun are known to attack coastal cities on Cinallis or boats in their surrounding waters.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Blas Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Mahasagar',
        'Mahasagar is located halfway up the Western coast of Krukiathu at the edge of the barren lands of the Dunn Zustand. The city''s location is quite unusual considering its population is mostly Duergar. The city has a massive fort and large forges which are responsible for equiping the forces along the boarder of the Scalar Patha and the raiding vessels to the South. Most if not all of the Ghuzalterok Remnant battleships and other large naval vessels are built in Mahasagar.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dunn Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Smert',
        'Located on the North Eastern shore line of Krukiathu between Oshbiruk and Tlatelok, Smert is a costal town that survives off the ocean and the darkening landscape. Some travel between the two other costal cities remove some of the town''s remote nature but it remains a relatively remote area.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dunn Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Gryaz',
        'Located North East of Tephletan, Gryaz is a crossroad town that eeks out a living on its travelers and the surrounding wetlands of the Northern wastes.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dunn Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Birgstal',
        'Located North of Zult, Birgstal sees some travelers passing along the Kierstire Mountain range but is mostly known for its heavy industry that adds resources to the forges of Bralgoz.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dunn Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Ugat',
        'Located South of Zult, Ugat survives on shipments passing through from the South but provides for itself with whatever farming it can accomplish in the fading landscape around the town.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dunn Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Azotaph',
        'Located South West of Zult, Azotaph farms as much as it can from the wastening landscape but also serves as one of the many crossroad towns before entering the wasteland roads of the Dunn Zustand.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dunn Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Foln',
        'Located West of Zult, Foln provides a stopping point between and into the Kierstire Mountain range. The town survies the best it can from the wetlands to the South.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dunn Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Kod''Gaz',
        'Kod''Gaz is located on the North West Coast line of Krukiathu and is surrouded by barren lands with a large span of mountains to the North. Much unlike other Orc and Goblinoid dominated cities Kod''Gaz is more focused on fishing out of the cold Northern waters of the Tantum Ocean. Much of the produce of Kod''Gaz is used for food in the inland regions of the DunnZustand.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dunn Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Voeld',
        'Voeld is located on the South Western edge of the Northern Krukiathu volcanic mountain range. Voeld is an acient Drow fortress dated back to the Mythic age and is one of the oldest cities on Anara. The upper region of the city is a fort carved into and amongst the mountains with the more civilian related infrastructure located underground. The city is known to remain in complete darkness without any type of light sources regardless of the time of day. Many of the Ghulaterok Remnant''s most powerful artifacts came and still orginate from Voeld.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dunn Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Zotlal''Teph',
        'Zotlal''Teph is located West of Zult in the center of Krukaithu and is surrounded by marsh land often making traveling through the area difficult due to the terrain. Zotlal''Teph was once one of the more advanced research facilities for the Ghuzalterok during the Schism War. However the city was destroyed during the fighting and has remained in ruins due to the mutated in habitants of the city which act like ferral animals.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dunn Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Zult',
        'Zult is located in the center of Krukiathu surrounded by a barren landscape. Zult is another one of Anara''s oldest cities. During the Schism Age however the Zult Spiel was built at the city''s center and now towers over the entire city. Massive walls were also built around the city during the war along with powerful fortifications which still remain. Each attempt to assualt the city throughout the centuries has ended in failure. Underneath the Zult Spiel is said to be a nearly endless dungeon like prison which has never been escaped from.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dunn Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Bralgoz',
        'Bralgoz is located along the South side of the Northern mountain range of Krukiathu right up to the edge of a massive volcano and its surrounding mountains. Bralgoz serves as the Ghuzalterok Remnant main forge where local volcanic activity is used to power the forges. The city is mostly home to Duergar and other parts of the city extend deep underground of the surrounding mountains.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dunn Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Tephletan',
        'Tephletan is located East of Zult in the center of Krukiathu and in the middle of a flooded marsh. The city was ruined during the Schism War durring the many earthquakes that took place. As the surrounding marsh land sank Tephletan began to be submerged in a bog like lake. Many of the city''s building collapsed and its population was forced out. Presently the ruins are home to a black dragon, which through elemental influence is further degrading the surrounding environment.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dunn Zustand')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Oshbriruk',
        'Oshbiruk is located on the North Eastern edge of Krukiathu. The city produces a good amount of food through its ports and is one of the more normal cities on the continent. Despite the more average life style of its citizens, the city''s populace is utilitarian and cold, reflecting the surrounding cold barren areas of the city.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dunn Zustand')
);
-- Eintra'Teph is underwater (the crater)
INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Eintra''Teph',
        'Eintra''Teph was once located on the Northern part of Krukiathu at the center of the mountainous islands that are now North of the continent at the present day. Eintra''Teph now lies wholy destroyed and all but forgotten after it was destroyed at the beginning of the Dark Age. Eintra''Teph was the location of Ediv es Corvus Delictum (Proclamation of Body of Evidence) where mortals asked the gods to remove the foul and tempered parts of themselfs, ultimately leading to the Schism War and subsequent ages.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dunn Zustand')
);


-- Glaciem sub locations
-- Gladis is part of Acien government
INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Gladis',
        'Gladis is located on the tip of a forested cape that extends out from the coast of Glaciem South of Acies. The meager town is sustained by local fishing and hunting in the nearby woods. While the town is part of the Itamevoth Theocracy which rules the continent of Acies to the North. However, the town is largely isolated from the rest of the theocracy. While there may be religious people living in the town, much unlike other parts of the theocracy there is no church in Gladis. Aside from its isolation from its ruling government Gladis is well known as a lauching point for any expedition that wishes to explore the continent of Glaciem. Though any expeditions that aims to pass through the Eye of Anara is likely to never be seen again.',
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
        'Iturrium',
        'Iturrium is not on any available map and is only really known about by its guardian. At the center of the Eye of Anara is a break in the never ending storm and crater with splintering fractures radiating out from it. At the center of this crater is Iturrium which roughly translates to "The Inverted Spire". Iturrium is a stone tower that rises up about 70 feet high but has no windows. The tower only has one set of double doors and following with its name rather than having levels rising from the ground the tower is actually an entrance to a large underground fortifcation complex. Its construction was carried at the start of the Dark Ages and was made to house the piece of Ghuluk''s flesh that was severed by Veilith''s Spear as she struck him to the ground. At the bottom of the complex Veilith''s Spear still sits pinning the piece of flesh to the ground of Anara.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Glaciem')
);


-- Pale Wastes sub locations
INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Dulrath',
        'Dulrath is located in the Pale Wastes North of the Krukaithu continent at the feet of a small mountain range. The surrounding area has spotted trees and South of the city is a gulf littered with islands. The population is a group of Frost Giants who are fiercly territorial of the surrounding area. The also have a hostile relationship with Balaroth in the East and openly defy his claim to power over the Pale Wastes.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Pale Wastes')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Lutzun',
        'Lutzun is located towards the Western edge of the Northwall Mountain range in the Pale Wastes. The city''s entrance is carved into the side of one of the mountains and features a large staircase which decends down deep under the mountain where the main city is located. The city is home to a group of Duergar which have no relation to the Ghuzalterok Remnant. Though they never really see visitors they are very wary of them and avoid contact with the Giants of Dulrath to the West. They often have to protect their surrounding area from local barbarians. ',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Pale Wastes')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Balaroth''s Peak',
        'Balaroth''s Peak is located out in the hilly expanse of the Pale Wastes at the top of the tallest mountain on Anara. There are a few lesser surrounding mountains where some of Balaroth''s subjects live but the area is mostly devoid of anything but ice.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Pale Wastes')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Aiel',
        'The remains of Aiel (also known as the Thrown City) are found just North of where the sliver of land connects Cinallis and the Pale Wastes on the opposite side of the Northwall Mountain range. Though a few treasure hunters have gone out to inspect the craters of where the city fell, the area is very dangerous due to local barbarians and Balaroth who sometimes patrols the area himself. To the locals however, the area is refered to as "The Stones" due to the various parts of the former stone walled city sticking up out of the ice. Many holes made by the city can be found but are often filled with more dangers than above ground.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Pale Wastes')
);

/*
* Lundus Plane locations
*/
INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Lundus',
        'The large moon in the sky which the plane of Anara orbits, which is actually the excess remnants of dead elemental titans. Lundus is often associated with the realm of the dead and after life. Once a month Lundus covers Solis in the sky for a day causing a long lasting eclipse. Sometimes storms can be seen raging on its surface.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Solis Sphere')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Uhmbrid',
        'The Uhmbrid is a large ziggurat like structure made from a black marble like stone. The structure is located along Lundus'' equator and is used to maintain the The Ulatum Veil (AKA the Sea for Stars). Once within range of the nebula, masses of corrupted souls from Anara are fired out into the Astral Sea to become part of the nebula which has been used for millennia to close off the Solis Sphere from the rest of Xenturi.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Lundus')
);

/*
* Fusilia Plane Locations
*/
INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Fusilia',
        'Fusilia is the plane in the Solis Sphere that orbits closest to Solis is comprises both the elemental planes of fire (surface level) and earth (underground level). The surface of the plane is a barren hellscape of molten rock and ash. Beneath the surface rivers of lava cut through the stone and the various caverns that make up the underground areas of the plane.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Solis Sphere')
);

/*
* Gelida Plane Locations
*/
INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Gelida',
        'Gelida is located farthest away from Solis in the Solis Sphere and makes up both the elemental planes of water (below the ice crust) and air (above the ice crust). The shape of the plane is formed by a spherical hollow ball of ice which is filled with water, above the icey surface though a constant storm rages at all times blowing snow and debris constantly. Within the water below numerous blocks of ice float around almost like homes to their elemental inhabitants.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Solis Sphere')
);

/*
* Lapis Plane Locations
*/
INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Lapis',
        'Lapis is located after Lundus in distance from Solis in the Solis Sphere making it the third plane in orbit of the star. Other than the needle and spire like rocks and mountains the plane has scattered ruins from the past celestial civilizations that held station as Custodians until the Schism War. The ruins are old and weathered but the plane still has inhabitants. A few of the Custodians refused to take sides in the Schism War and remained but were ultimately locked on Lapis as punishment as the life of the plane slowly faded. These celestials that still remain hold a good amount of distain for the mortal races of Anara and their new set of gods.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Solis Sphere')
);

/*
* Solis Plane Locations
*/
INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Solis',
        'Solis is located at the center of the Solis Sphere and acts as the sphere''s star and as the orbit point for the other planes in the sphere. Originally Solis was just a source of light provided by Tamterasu, but at the end of the Schism War Tamauht pulled the other good aligned gods up into Solis creating a heaven like place for the good panthoen.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Solis Sphere')
);

/*
* Solis Sphere Sub Locations (in the astral sea)
*/
INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Sea of Stars',
        'Band of asteroids and nebula made to block the Anaran Sphere off from the rest of Xenturi, from the plane of Anara it can be seen for a month about once every 30 years. The nebula is actually artificial and powered by corrupted souls infused from the Uhmbrid on Lundus. From Anara it appears as a band of twinkling silvery mist, and turns red during Lundus.',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Solis Sphere')
);


/*
*    Historical Ages
*/

INSERT INTO [Lore].[HistoricalAges]
    ([Age],
    [Description])
VALUES(
        0,
        'First there was darkness then a flash of light (unknown divine entities did this). These two entities were gods leaving Xenturi during the "Exodus".'
);

INSERT INTO [Lore].[HistoricalAges]
    ([Age],
    [Description])
VALUES(
        1,
        'After this flash there was swirling of elements until primordial titans emerged from them along with 4 divine offspring named Tamteru, Veilrak, Ilzu, Gunaruk, these gods were neither good nor evil and possessed traits of both, light and dark, pleasure and pain, honor and deceit, sacrifice and gluttony. Before the beings from Xenturi left to The Far Realms they informed the new fledgling gods of the horrors beyond the Ulatum Veil (Sea of Stars) and warned them to take control of the elements and close off the Solis Sphere to the rest of the Xenturi in hope that life could begin anew in Xenturi from the Solis Sphere.'
);

INSERT INTO [Lore].[HistoricalAges]
    ([Age],
    [Description])
VALUES(
        2,
        'After a few hundred years the gods subdued the elements and the titans related to them. From the earth and fire elements the world (Anara) and its molten core was formed. From water the oceans were made, from wind and lightning rain and other weather was created. Then the god of light and dark created the sun (Solis) and moon (Lundus, huge stellar body which Anara orbits and is often associated with the realm of the dead and afterlife) while the other 3 gods made the races of the world with the Tree of Inheritors also known as Iennialaed.  
'
);

INSERT INTO [Lore].[HistoricalAges]
    ([Age],
    [Description])
VALUES(
        3,
        '5000 years later as the races of the world grew, they began to criticize the gods in their duality and began to openly defy them. This drove the gods to separate themselves from their negative traits to create a better world for the created races of the world but doing so sparked a huge war that ruined most of civilization and doubled the number of gods. 8 totally different gods emerged 4 wholly good and 4 wholly evil. The war raged on for an unknown amount of time as its was totally, wholly and all-encompassing and the gods were wholly focused on the war (one notable reason for the loss of time is the sun dimmed as the god of light had to focus their power on the war).  

        Eventually the lesser races and good gods devised a way to seal the evil gods away but in doing so found that they were still inexorably linked to their evil counter parts and as they sealed them away, they too were banished. The good gods were ripped into the sky where then sun now sits, and the evil gods were thrown deep into the ground creating a giant crater (this is now covered by ocean, but one edge of the crater creates a mountain range connected to land on the North side of Krukiathu). This created an ice age that lasted for about 100 years as dust filled the sky.'
);

INSERT INTO [Lore].[HistoricalAges]
    ([Age],
    [Description])
VALUES(
        4,
        'During the ice age there was almost no influence from the gods, priests could not hear from them, divine magic disappeared and regular magic mostly disappeared as well. (The gods did not yet know how to send their influences across the planes).'
);

INSERT INTO [Lore].[HistoricalAges]
    ([Age],
    [Description])
VALUES(
        5,
        '5000 years later, the races of the world were then left to their own devices with slight influences from the banished gods as their power still creeps into the world. Churches remain to the good gods as cults to the evil gods also remain.'
);

/*
* Events
*/

INSERT INTO [Lore].[Events]
    ([Name],
    [IsMultiDayEvent],
    [Description])
VALUES(
        'Ediv es Corvus Delictum',
        0,
        '(Proclamation of Body of Evidence) The event that inspired the gods to separate themselves from the evil portions of themselves. The gods were summoned by a huge mass of mortals from every race on Anara lead by The Inhaerent Custodium and handed a list of grievances and wishes leading to heavy introspection by the gods of the Mythic Age.'
);

INSERT INTO [Lore].[Events]
    ([Name],
    [IsMultiDayEvent],
    [Description])
VALUES(
        'Schism War',
        1,
        'The Schism War is also known as the War of Separations and encompasses nearly the entire Schism Age. Originally the war started as a result from the vast differences in the resulting gods after separation and how that radicalized their followers. What started as local religious skirmishes eventually led to full fledge war between the two opposing sides of the pantheon. Eventually the gods themselfs got involved and vastly changed the scale of the war. The skies were clouded with smoke and fire, and the very foundations of Anara shook as the gods clashed. The concept of time was lost as the gods of dark and light fought against each other and neutral parties were regularly persecuted. Every city on every continent was involved and lasted for at least two generations in total. The battles carried out by the gods often left the surrounding areas scared or completely changed, craters were formed, Pulchra was cast into the sea, Anara''s rate of rotation was changed, a whole section of Acies was glassed and turned into a dessert. The weapons and techonolgy of the time would seem like science fiction to the present people of Anara, giant war machines fought against giants, elemental beam weapons were mounted on city walls, the Warforged were made and magical items were common. Eventually Tamauht, witnessing the endless fighting decided to banish the evil gods away under the surface of Anara. This act known as The Banishment to turned out to affect all the gods, Terasu, Zhule, Rathak and Guhluk were sent under the surface and created the Hells and the Abyss while the good gods were pulled into the sky and imprisoned within Solis. No mortal really knows about the banishment as all witnesses were burnt away at Luk''Teph when it was turned into a dessert. As the evil gods were pulled underground mass amounts of ash and dust were sent into the air triggering a brutal ice age known as the Dark Age.'
);

INSERT INTO [Lore].[Events]
    ([Name],
    [IsMultiDayEvent],
    [Description])
VALUES(
        'The Banishment',
        1,
        'The Banishment was carried out on the plains of Luk''Teph by Tamauht. Tamauht drew Solis from his staff and cast it into the sky where a portal opened from which bright radiant burning chains flew out and bound all the gods. The good gods were ripped into the sky with Solis with such force that storms around the plane were made. The evil gods were violently pulled beneath the earth on the North side of Kurkiathu forming a massive crater and filling the sky with dust and ash. From here Anara would enter a brutal ice age known as the Dark Age.'
);

INSERT INTO [Lore].[Events]
    ([Name],
    [IsMultiDayEvent],
    [Description])
VALUES(
        'The First Crusade',
        1,
        'Charge made by those guarding the Scalar Patha during the Dark Age. This event marked the return of Divine magic. 100 fighters of the remaining population of Acies were charged with guarding the path to Krukiathu, equipped with rusty weapons and armor, wrapped in furs, charged from their fortifications against approaching remnant forces in a suicidal charge led by a man named Kaled that ultimately stopped the advance of the approaching forces. This charge is immortalized in murals within the Itamevoth Theocracy and in the poem written below: 

        - I 

        Half a charge, half a charge, 

        Half a charge onward, 

        All down onto the Scalar Patha, 

        Raged the one hundred. 

        “Forward, revive the crusade! 

        Pay with your bloods iron!” he said. 

        On the Scalar Patha, 

        Charged the one hundred. 

        - II 

        “Charge, for the Crusade!” 

        This zealous charge displayed, 

        Faith of the remaining few. 

        Faith of those once sundered. 

        Beneath the cold, dark sky. 

        Roaring out the final breath, 

        With no choice but to do and die. 

        Onto the path of death, 

        Raged the one hundred. 

        - III 

        Demon to the right of them, 

        Devil to the left of them, 

        Elements before them. 

        Steel clashed and thundered; 

        As they charged the lines of hell, 

        Fearless steel-clad shells, 

        Straight to certain death, 

        But hardly a man fell. 

        Raged the one hundred. 

        - IV 

        Rusted swords gleaming bare, 

        Gleaming as they cut the air, 

        Smiting the darkness there, 

        Fighting in the bloody snow, 

        Those, once sundered. 

        Spearing though fire and smoke, 

        Though the line of shields they broke; 

        Acien and Krukiathan, 

        Split and felled by sword stroke, 

        And still we wonder. 

        How one might come back, 

        But not all one hundred. 

        - V 

        Demon to the right of them, 

        Devil to the left of them, 

        Elements before them. 

        Steel clashed and thundered; 

        As they charged the lines of hell, 

        Many a great hero fell. 

        They that fought so well, 

        Returned from the path of death 

        To establish the new citadel, 

        Those that remained, 

        Remained of the one hundred. 

        - VI 

        For this there was no accolade, 

        Only rusty, bloody, blade 

        But the faithful still remember, 

        The charge of the First Crusade, 

        The charge that ended the Dark Age, 

        And the immortal one hundred! '
);


/*
* Factions
*/

INSERT INTO [Lore].[Factions]
    ([Name],
    [Description])
VALUES(
        'Tamel Imperium',
        'Empire made of various kingdoms that occupies most of the southern portion of Cinallis. Currently ruled by Henrik Tamel, with various kings, dukes, and barons beneath him.'
);

INSERT INTO [Lore].[Factions]
    ([Name],
    [Description])
VALUES(
        'Doaverine Junta',
        'An assembly of clans who select a ruler called the "Muintir" once every 20 years located on the Northern part of Cinallis. The individual clans actually hold a large amount of autonomy but remain allied to resist outside influence. Once a part of the Tamel Imperium that won a war of independence about 900 years ago. Currently headed by Elise D''larrawill from D''larrawill.'
);

INSERT INTO [Lore].[Factions]
    ([Name],
    [Description])
VALUES(
        'Itamevoth Theocracy',
        'A government led by the churches of the good gods with a head chosen from among them thus totaling 5 leaders located on Acies. People of the Theocracy are devoutly religious and locked in constant conflict with the Remnant. Currently led by The Sage (tittle) Solamir “the Old” (an old man think of father time and follower of Tamauht), and the Arch Priests; Layna (elf woman Older Tamauht), Yamis (Earth Genasi, Iyla), Vordeth (Silver dragonbon middle aged, wears armor, spear, shield more likely a paladin, Veilith), Rodrik (Old Dwarf man, Inaru).'
);

INSERT INTO [Lore].[Factions]
    ([Name],
    [Description])
VALUES(
        'Ghuzalterok Remnant',
        'A loose government remaining from the leftovers of the Schism War where the evil aligned races have banded together to wage war on the good races of Anara located on Krukiathu. Has been at constant war with the Itamevoth Theocracy. Drow Leader Dyla Gisspawned, Orc/Beast/Goblin Leader Tathnok, Duergar Leader Torg Deepsmith, Chromatic Dragonborn  Ra''ush Bilebreath, Human Leader Krieg Luftvalker (Indian, Middle Eastern, Russian, Egyptian, Dark Fantasy Names) '
);

INSERT INTO [Lore].[Factions]
    ([Name],
    [Description])
VALUES(
        'Inhaerent Custodium',
        'A secretive organization that charges itself with the protection of all of Anara. It remains neutral in politics and wars of governments, but actively seeks to undermine remnant forces on Anara. While it often works with the Itamevoth Theocracy and other governments on Anara it does not take orders from them. Members go by code names and refrain from exchanging their real names, nearly all members leave their family behind as well. Their symbol is a set of five circles one large and four other small circles surrounding it with geometric shapes which hold ancient meaning connected to the good pantheon of gods.'
);

INSERT INTO [Lore].[Factions]
    ([Name],
    [Description])
VALUES(
        'Lurkers',
        'A large thieves guild based in the Tamel Imperium. Normally work under a strict moral code but operate outside of the law. The head of the organization is called the Hand and their lieutenants are called Fingers. Their symbol is an open hand with an eye in the center of its palm.'
);

INSERT INTO [Lore].[Factions]
    ([Name],
    [Description])
VALUES(
        'Ordo Statera',
        'Before the Schism war there was a small clan of people who existed that only came out to provide balance in the name of Xotlasihm known as Ordo Statera. They were only mentioned as shadows and identified by the symbol on their weapons and jackets. These few and secretive individuals carry the knowledge to create fire arms, and strive to maintain balance on the plane of Anara only acting when they believe it to be necessary. The symbol of the clan closely resembles the amulet that Xotlasihm is often depicted with which has a shape close to that of a 5 pointed star. However, the clan symbol has the initials "O.S." of the clan placed within the center of the star like shape.'
);

INSERT INTO [Lore].[Factions]
    ([Name],
    [Description])
VALUES(
        'Lex Ferra',
        'Once a great company of warriors during the Schism War that dwindled to almost nothing during the Dark Age. The company is now but a shadow of its former self operating as mercenaries and working for coin. Still to this day however, the company holds a great repuation with the clients that start contracts with the group.'
);

INSERT INTO [Lore].[Factions]
    ([Name],
    [Description])
VALUES(
        'Steel Triad',
        'A ruthless mercenary group that values pay above all else. They take just about any job that they deem pays well enough, though they never take jobs from the Ghuzalterok Remnant to keep up appearances with the governing bodies of Anara.'
);

INSERT INTO [Lore].[Factions]
    ([Name],
    [Description])
VALUES(
        'Order of the Phoenix',
        'A group of influential knights who are seeking to restore lost kingdoms and lands devastated by the remnant. Many of the members claim to be decendants of the former Gandersheim Alliance in the West Marches. The two main headquarters are located in the Tharkad in the Tamel Imperium and in Giliad in the Doaverine Junta.'
);


/*
* Aritfacts
*/

INSERT INTO [Lore].[Artifacts]
    ([Name],
    [Description])
VALUES(
        'Terasu''s Rahaslicon',
        'Black stone covers with an eye carved into the covers. The book is bound with a black leather which is riveted to the stone. The book is incredibly large tome and heavy weighing 30lbs. The contents of this foul manuscript of ineffable wickedness are so rabid that creatures of an alignment suffer merely by touching it. No mortal was meant to know the secrets it contains, knowledge so horrid that to even glimpse the scrawled pages invites madness and nature can''t abide the book''s presence.'
);

INSERT INTO [Lore].[Artifacts]
    ([Name],
    [Description])
VALUES(
        'Veilith''s Spear',
        'Veilith''s Spear is located in the Eye of Anara at the bottom of Iturrium. This spear was weilded by Veilith during the Schism War and according to ledgends served as a powerful ranged weapon in addition to melee combat.'
);

INSERT INTO [Lore].[Artifacts]
    ([Name],
    [Description])
VALUES(
        'Inaru''s Chains',
        'Inaru''s Chains are located in the ruins of Aiel (AKA the Thrown City )beneath the ice of the Pale Wastes. During the war the chains were used as support to keep the main forge Aiel stable during operation. A white dragon (Balaroth) from the pale wastes seeks the chains.  
'
);

INSERT INTO [Lore].[Artifacts]
    ([Name],
    [Description])
VALUES(
        'Iyla''s Ward',
        'A blue saphire cloak with golden trimings worn by Iyla themself which were said to have healing and nurturing properties. They lie at the end of the Serenus Semita (Serene Path) in The Nubes Castellum overseen by Aihurem "The Pure".'
);

INSERT INTO [Lore].[Artifacts]
    ([Name],
    [Description])
VALUES(
        'Tamauht''s Mirror',
        'A cross between a staff and a two handed morning star Tamauht used this weapon as both a spell casting focus and a melee weapon. After the banishment the weapon was left at its casting place and was claimed by the very few survivors of Luk''Teph who brought the weapon back below ground to be stored. '
);

INSERT INTO [Lore].[Artifacts]
    ([Name],
    [Description])
VALUES(
        'Zara Mazzallam',
        'Black crystal edifice that is said to have instantly raised the sprits of Ghuzalterok forces in battle during the schism war and to rend the minds of enemies nearby. Currently located in the labrinth like dungeon of Tenbraz.'
);

INSERT INTO [Lore].[Artifacts]
    ([Name],
    [Description])
VALUES(
        'Iennialaed',
        'Created by Tamteru, Veilrak, Ilzu, Gunaruk and is the source of all life on Anara. Forged from the main essences of the primordial titans and parts of the gods themselves. Gunaruk carved the tree from neairite, Tamteru inscribed the runes on the tree''s branches, trunk, and roots with adamantine, then Veilrak gave up their sliver blood from which diamond leaves sprouted from the branches and Ilzu drew blood from the diamond leaves and gave birth to the first soul on Anara, a diamond dragon Geleondiril tasked with the protection of the tree. The magic used by these gods to create the tree was so powerful it reduced their powers substantially.
        
        The tree has dark crystal bark inscribed with impossibly small runes filled with adamantine and stands 100ft tall with diamond leaves sprouting from its branches which never fall off and constantly drip with silver blood of the celestials that made it. The tree currently resides in the Mountains of the Pale Wastes North of the Pale Gulf underground and under heavy protection from guardians placed by the gods.
        
        The tree is the source of life on Anara and all new souls are borne from it. When someone dies if their soul is still pure it is returned to the lake of silver blood (AKA The Lacuph Anmerith -> The Lake of Souls) at the base of the tree to be remade into other souls. As a person grows in experience and memoires those are turned into energy to produce more souls than the one given to the lake. If a soul is deemed unworthy it is taken to Lundus to be disposed of and cast into the Sea of Stars.'
);

INSERT INTO [Lore].[Artifacts]
    ([Name],
    [Description])
VALUES(
        'Sha''Arhirm',
        'Created by Tamteru, Veilrak, Ilzu, Gunaruk and is a gateway to Lundus used to take and dispose of corrupt souls there. It resides in the same subterranean room as The Tree of Inheritors. The gateway is made of gray marble with etched platinum runes and from the Anara side the inside of the gate looks to be a swirling black abyss, from the Lundus side it apears to be a swirling grey portal with sparkling lights. This gateway is guarded by two Marut constructs who spend their time watching over the gateway, one on each side and if any corrupted soul were to try to pass back to Anara the two gaurdians would seek to return them to Lundus at any cost.'
);


/*
* Resources
*/

INSERT INTO [Lore].[Resources]
    ([Name],
    [Description],
    [Rarity])
VALUES(
        'Black Silver',
        'Found in small patches of silver ore veins rarely all throughout Anara. Carries half the worth of gold (like electrum). Though what causes black silver has been lost to time, it is known for its shielding properties (of which far surpass lead), anti-divination and non-corrosive properties. (In the Mythic Age it was known as "Titan''s Blood" which is silver imbued with Celestial or Primordial blood).',
        4
);

INSERT INTO [Lore].[Resources]
    ([Name],
    [Description],
    [Rarity])
VALUES(
        'Lead',
        'Found all around Anara, not particularly worth much but has been known to have shielding and anti-divination properties.',
        1
);

INSERT INTO [Lore].[Resources]
    ([Name],
    [Description],
    [Rarity])
VALUES(
        'Platinum',
        'Found all around Anara, though rare, beyond currency Platinum is used as the base material component for enchanting, that with its other qualities makes it ten times the price of gold.',
        3
);

INSERT INTO [Lore].[Resources]
    ([Name],
    [Description],
    [Rarity])
VALUES(
        'Neairite',
        'Found deep in the Under Dark. Rare to find on the surface of the plane, but it''s is known to be extremely hard (though not more than a diamond) and to enhance psionic, physic, illusion, and divination magics. Only worth 10gp per pound due to the difficulty to work with it due to its hardness.',
        3
);

INSERT INTO [Lore].[Resources]
    ([Name],
    [Description],
    [Rarity])
VALUES(
        'Cinallis Poppy',
        'Found in the mountains and Southern portions of Cinallis, is known for its bright red petals, pain killing and blood cloting qualities. Can be used to make weak healing potions and salves.',
        2
);

INSERT INTO [Lore].[Resources]
    ([Name],
    [Description],
    [Rarity])
VALUES(
        'Monolis Flower',
        '(Looks like an Ajisai flower) represents love in the Frillis Cartaue.',
        1
);

INSERT INTO [Lore].[Resources]
    ([Name],
    [Description],
    [Rarity])
VALUES(
        'Jaunes',
        'Yellow looking rose tulips in the Bruessix area.',
        1
);

INSERT INTO [Lore].[Resources]
    ([Name],
    [Description],
    [Rarity])
VALUES(
        'Nightshade',
        'Found all over the plane but not in large quantities. Known for its light purple petals interior yellow buds and toxic characteristics. Can be used to make weak poisons.',
        3
);

INSERT INTO [Lore].[Resources]
    ([Name],
    [Description],
    [Rarity])
VALUES(
        'Widow''s Veil',
        'A rare moss like plant that sometimes grows on corpses that had their souls forcefully taken by Xotlasihm after death. Culturally this moss is seen as an ill omen and superstitious people avoid it and beasts refuse to eat the body it grows from. Appears as a black moss on top of the corpse where in thin areas it may resemble a black veil and this is where it gets its name. In addition to the black foliage of the moss in thicker areas of it thin root like branches with needle like thorns can be found most often digging into the corpse. If one where to harvest the moss then smoke it, it would be accompanied by an alkaline acidic smell and taste while granting the consumer the ability to see 10ft into the ethereal plane for 1 minute and the ability to communicate with any beings it can see, however the consumer is considered poisoned for the duration if they fail a DC15 Constitution save.',
        5
);


/*
* Terminologies
*/

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Plane',
        'Planet.'
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Sphere',
        'System (ie. the Solar System).'
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Oversphere',
        'Galaxy.'
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Astral Space',
        'Space.'
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Cycle',
        'One revolution of a plane around its star.'
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Cycle Velocity',
        'The rate at which a plane is said to complete its cycle or move through the Astral Sea.'
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Planar Delta',
        'Boundary between planes, for example; for a astral ship to leave the plane to Astral Space it must “exceed the Planar Delta”.'
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Absolute Delta',
        'Refers to the force required to break the Planar Delta, or a state in which one exceeds the planar delta “we have reached absolute delta”.'
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Planar Assignment',
        'A person''s or object''s home plane, for example, for the successful completion of a “Planeshift” spell, one must have an object with a “Planar Assignment” of their destination plane unless they are from that plane.'
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Planar Attraction',
        'A force between two planes or a plane in close proximity which draws them closer together.'
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Planisphere',
        'The breathable air between the surface of the plane and the Planar Delta.'
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'The Manifold',
        'The space that gods of Xenturi went to that did not leave in the Exodus. It is an infinite set of alternate dimensions called Frames. To travel to another manifold you must pass through a Duct and to enter you must enter via a Transition.'
);


INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Manifold Frame',
        'A single dimension in The Manifold.'
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Manifold Duct',
        'A link between manifolds either via a natural anomaly or through technological/magical implementation.'
);


INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Manifold Transition',
        'An entry way into The Manifold, either created by magic, technology, or in rare cases a naturally occuring anomaly.'
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Far Realms',
        'Other Overspheres (galaxies) beyond the edge of Xenturi.'
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'The Expanse',
        'The space between Overspheres.'
);

/*
* Start of GeoMaps
*/

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Acies',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Acies'),
        'Acies.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Anara',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Anara'),
        'Anara.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Cinallis',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Cinallis'),
        'Cinallis.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Krukiathu',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Krukiathu'),
        'Krukiathu.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Salted Tides',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Salted Tides'),
        'Salted Tides.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Tamel Imperium',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Tamel Imperium'),
        'Tamel Imperium.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Doaverine Junta',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Doaverine Junta'),
        'Doaverine Junta.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'West Marches',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'West Marches'),
        'West Marches.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Banewright Kingdom',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Banewright Kingdom'),
        'Banewright Kingdom.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Deepstone Kingdom',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Deepstone Kingdom'),
        'Deepstone Kingdom.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Dirmil Kingdom',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dirmil Kingdom'),
        'Dirmil Kingdom.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Tamel Kingdom',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Tamel Kingdom'),
        'Tamel Kingdom.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Blas Zustand',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Blas Zustand'),
        'Blas Zustand.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Dunn Zustand',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Dunn Zustand'),
        'Dunn Zustand.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Grun Zustand',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Grun Zustand'),
        'Grun Zustand.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Earrann Clach',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Earrann Clach'),
        'Earrann Clach.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Earrann Geal',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Earrann Geal'),
        'Earrann Geal.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Earrann Uaine',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Earrann Uaine'),
        'Earrann Uaine.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Frigus Domus',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Frigus Domus'),
        'Frigus Domus.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Scalar Domus',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Scalar Domus'),
        'Scalar Domus.jpg'
);

INSERT INTO [Lore].[GeoMaps]
    ([Name],
    [LocationId],
    [Filename])
VALUES(
        'Scutum Domus',
        (SELECT TOP 1
            [Id]
        FROM [Lore].[Locations]
        WHERE [Name] = 'Scutum Domus'),
        'Scutum Domus.jpg'
);

/*
* Start of NPCs (Gods and other entities are included)
*/

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Tamauht',
        'Deity',
        'Normally shown as a man with long white hair and light in his eyes in brilliant plate armor wielding a two-handed morningstar emitting light or fire.',
        'Followers of Tamauht seek to destroy evil things, enter dark areas and rid that area of evil, find lost knowledge, guard the safety of the world, planes and their boundaries. 

        Commandments: 
        - Bring light to dark places 

        - Illuminate that which cannot be seen 

        - Uphold the sanctity of time and planes 

        Prayers:
        - "hetu en prataya" (direct causes and indirect conditions, which underlie the actions of all things) 
'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Iyla',
        'Deity',
        'Normally depicted as an incredibly beautiful elven woman with golden hair and blue glowing eyes wearing low cut see through white silken robes. Or in the more conservative churches as a elven woman in saphire blue robes with gold trimmings.',
        'Followers are normally Free spirited, artists, go on pilgrimages often, and may never return from pilgrimages as they tend to establish churches during their trip. Iyla''s followers also seek to free those bound to others by slavery or debt.
        
        Commandments:
        - Release that which is held 

        - Bring joy to the senses 

        - Avoid stagnation and embrace the new'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Veilith',
        'Deity',
        'Blindfolded dark-skinned woman in valkyrie like armor holding a spear and shield, longsword sheathed at her side.',
        'Followers seek to uphold the law and morals of society, often target internal corruption, soldiers and guards often look to her in worship, and seek to do what is best for the collective group. 

        Commandments: 
        - Never betray 
        
        - Fight for the weak 

        - Cultivate morality'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Inaru',
        'Deity',
        'Black haired woman in priestly white robes with golden trim holding a ringed staff and a sickle or hammer.',
        'Followers are normally smiths, famers, builders, craftsmen etc., seek to produce the best things they can, often seek out sources of undead or other elements of decay to destroy them. 

        Commandments: 
        - Feed the populace 

        - Shelter the cold and weary 

        - Purify the dead'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Terasu',
        'Deity',
        'Amorphous, black robed figure, or a grey skinned being without eyes.',
        'Followers normally covet knowledge and secrets, are often completely crazy, often have elements of their face removed (eyelids, ears, lips, nose), use of illusions is also common.

        Commandments: 
        - Watch from the dark

        - Take that which reveals

        - Unravel chronology'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Zhule',
        'Deity',
        'Bald pointed eared man with red eyes and pitch black skin and horns wearing black hooked plate armor wielding a flail covered in hooks.',
        'Seek to dominate, enslave, and torture others, seek to rule over others, often mutilate others and do things out of spite.

        Commandments:
        - Cut their flesh

        - Drink of hate

        - Bind them in chains'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Rathak',
        'Deity',
        'Brown furred beast that looks like a demonic minotaur in worn full plate armor covered in scars with tears of blood streaming down his face wielding a flaming two handed sword.',
        'Followers are known to be savage fighters who show no mercy, they take what they want rather than ulterior methods, often hold grudges and seek vengeance.

        Commandments:
        - Annihilate the weak

        - Collect your debts in blood

        - Burn them to ash'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Guhluk',
        'Deity',
        'A decaying corpse resting in an open grave with tentacles emerging from under it, has a male voice, or a headless six armed four legged humanoid carrying a decaying head.',
        'Followers are often necromancers, some followers have been noted eating until death, seek to end life and devour it.

        Commandments: 
        - Devour all

        - Master undeath

        - Starve the others'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Aihurem',
        'Dragon',
        'Aihurem has a long snake like body of platinum scales that extends for hundreds of feet, and though they have no wings they are capable of flight. A mane of silver hair frames their head and they have four claws about their body but rarely use them.',
        'Aihurem is a platinum dragon and one of Iyla''s main servants who now resides within the Serenus Semita (Serene Path) at The Nubes Castellum watching over Iyla''s Ward. Aihurem has been watching over the artifact for millennia often sleeping for hundreds of years at a time.'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Astarot',
        'Dragon',
        'Astarot has a long snake like body of golden radiant scales that extends for hundreds of feet, and though they do not have wings they are capable of flight. Astarot''s head is shaped like an eagle with golden whiskers and antler like horns. Along the back of their body is a spine of straight golden hair.',
        'Astarot served as one of Tamauht''s main servants, a celestial Sun Dragon charged with guarding Solis after the Schism War. During the war itself however Astarot fought as the second in command of the White Legion. During the Bannishment they were pulled into Astral Space and now reside around Solis acting as its guardian.'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Geleondiril',
        'Dragon',
        'Geleondiril is a massive prismatic dragon whose body would appear to be made from diamond. Their tail has a glaive like ending.',
        'Geleondiril was the first soul to be forged from the Tree of Inheritors and was charged with the trees protection from the gods prior to their separation. Geleondiril now stands watch over the entrance to the chamber where the tree resides. Over the ages even the gods have been thwarted by Geleondiril when trying to destroy or reach the tree.'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Lemanoth',
        'Celestial',
        'Lemanoth is a large celestial clad in metal armor with an emotionless metal mask.',
        'Lemanoth is a Curator charged with the protection of the Uhmbrid a structure on Lundus used to maintain the Sea of Stars.'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Marut''Apor',
        'Construct',
        'Marut''Apor is a hulking construct protected with metal armor and has a large central eye with a metal disk enscribed with their purpose on their chest.',
        'Marut''Apor is a construct protecting the Lundus Gate on Lundus whoes goal is to keep corrupted souls from reentering the Anaran Plane.'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Marut''Laban',
        'Construct',
        'Marut''Laban is a hulking construct protected with metal armor and has a large central eye with a metal disk encribed with their purpose on their chest.',
        'Marut''Laban is a construct charged with protecting the Lundus Gate on Anara and keeping corrupted souls on the Lundus side of the gate.'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Xotlasihm',
        'Celestial',
        'A being often depicted as nothing but a regal black robe from beneath which golden eyes shine through black cloth. They are normally seen with an amulet and an urn. Underneath their robes is a grey skinned celestial covered in geometric shapes with no hair, no mouth and no nose on an androgenous body.',
        'Legends have it that Xotlasihm pulls souls into the urn they carry with the amulet and then take them into the afterlife. Many believe that they will take the dead to Lundus which is often thought of as being the realm of the dead. Xotlasihm is one of the few celestials to remain unaligned after the Schism War. They never speak, if they communicate with telepathy the recipient only understands its will and does not hear any words. Multiple souls can be stored in the urn at one time. When one dies on Anara, Xotlasihm escorts the soul of the dead back to Iennialaed, the Tree of Inheritors, unless the soul has been corrupted. When the soul is found unsuitable to be returned to the tree, they take them to Lundus and leave them there. In combat Xotlasihm will use the amulet they carry to blast foes at range and disrupt the movement of those around them, from the urn they will produce two short swords that act on their own like spiritrual weapons with a faint mist falling from them.'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Nulth',
        'Dragon',
        'Nulth is a blue adult shadow dragon with mat black scales that would almost appear like volcanic rock. From their body black mist trails down like smoke. Their eyes are a dark red and seated somewhat far back on the head. Two ram like horns emerge from the side of their head and curl back forwards towards the front of their mouth into points. Sharp spines jut out from the back of their head and a bit down their back. The leather of their wings break away from the dark black nature of their scales and hold a dark redish brown hue.',
        'Nulth was spawned 187 years ago from a blue dragon that had long held hatred against the people of Aceis. Unlike the parent dragon however, Nulth was indoctrinated into the worship of Terasu. Due to their commitment they have been placed as the guardian of the Zara Mazallam in Tenbraz. However, at the awakening of Terasu''s Rahaslicon Nulth has been called upon to retrieve the book and return it to Ghuzalterok hands.'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Tamteru',
        'Deity',
        'Tamteru was often described as a being made of darkness that abosorbs or emits light with no particular facial features.',
        'Tamteru had rule of over the combined domains of Tamauht and Terasu.'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Veilrak',
        'Deity',
        'Veilrak was normally depicted as a fully armored beastial warrior with a head that resembled a cross between a horse, jackal and bull along with a tail.',
        'Veilrak held rule over the combined domains of Veilith and Rathak.'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Ilzu',
        'Deity',
        'Ilzu was often depicted as a grey skinned fey like being whose face and hair changed with their mood.',
        'Ilzu had rule over the combined domains of Iyla and Zhule.'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Gunaruk',
        'Deity',
        'Gunaruk was often depicted as being with four arms each holding a different tool for building or embalming.',
        'Gunaruk had rule over the combined domains of Inaru and Ghuluk.'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Balorok',
        'Primordial',
        'A giant fiery serpent.',
        'Balorok was known to be quick to anger and at odds with Water and Earth. It also always sought change via destruction of the old.'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Atal',
        'Primordial',
        'A giant crustation like humanoid.',
        'Atal would be considered the most caring of the primordial titans as they always sought to cultivate life. Atal was flexible in their judgments but once ingrained they were resistant to stray from the status quo.'
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Ehekator',
        'Primordial',
        'Ehekator was said to be a massive bird made of storms.',
        'Ehekator was known to often change in agenda following whatever impulse came to them and nominally remained neutral.'
);


INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Xallax',
        'Primordial',
        'Xallax was a giant stone elemental that had resembalances to humanoids.',
        'Xallax was well known to despise Balorok the fire titan and Ehekator the air titan due to their impulsiveness. Xallax always saught to keep things as they were and to never change them as a means to maintain tradition.'
);
