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
        WHERE [Name] = 'Dirmil Kindgom')
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
        WHERE [Name] = 'DeepStone Kingdom')
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
        WHERE [Name] = 'DeepStone Kingdom')
);

INSERT INTO [Lore].[Locations]
    ([Name],
    [Description],
    [ContainingLocationId])
VALUES(
        'Bruessix',
        'Often overlooked due to its rustic nature, Bruessix stands out as one of the safest places in the Tamel Imperium. The people hold the duke in high regard due to his faithful efforts towards his subjects. The Jannis orchard also produces one of the more desireable wines in the kingdom.',
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
        'Earran Uaine (Verdent Wood) is located on the Western side of the Doaverine Junta and holds a border with the West Marches. This forest border is heavily patrolled by the clans of the junta. The rest of the region is dominated by open wilderness, hills, spotted trees, smaller towns and Mac''Tire its only major clan. The people of this region are highly territorial when it comes to the boarder and crossing can be perilous or if stopped it is not uncommon to be turned back.',
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
        'Earran Geal (Jade Wood) is located in the center of the Doaverine Junta and holds the junta''s Capital Doaverhim. Spanning the from the center to the North of Cinallis this region has fair temperatures in the South and cold temperatures in the North. There are two major forests and a few major clans along with the junta''s capital Doaverhim.',
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
        'Earran Clach (Stone Wood) is located on the Eastern side of the Doaverine Junta and harbors most of the countries dwarven population with its 3 dwarven cities. There are other clans beyond the dwarven led ones in the region but they have settled in the region''s forest or along its icy coast. In addition, this region has a small strip of ice and spotted snow covered islands that connect it to the Pale Wastes in the North. Some have ventured across it but it is normally seen as a worthless endevor due to the perils of the crossing and the numerous barbarian tribes and other dangers in the Pale Wastes.',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        'Iturrium',
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        '',
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
        ''
);

INSERT INTO [Lore].[HistoricalAges]
    ([Age],
    [Description])
VALUES(
        1,
        ''
);

INSERT INTO [Lore].[HistoricalAges]
    ([Age],
    [Description])
VALUES(
        3,
        ''
);

INSERT INTO [Lore].[HistoricalAges]
    ([Age],
    [Description])
VALUES(
        4,
        ''
);

INSERT INTO [Lore].[HistoricalAges]
    ([Age],
    [Description])
VALUES(
        5,
        ''
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
        ''
);

INSERT INTO [Lore].[Events]
    ([Name],
    [IsMultiDayEvent],
    [Description])
VALUES(
        'Schism War',
        1,
        ''
);

INSERT INTO [Lore].[Events]
    ([Name],
    [IsMultiDayEvent],
    [Description])
VALUES(
        'The Banishment',
        1,
        ''
);

INSERT INTO [Lore].[Events]
    ([Name],
    [IsMultiDayEvent],
    [Description])
VALUES(
        'The First Crusade',
        1,
        ''
);


/*
* Factions
*/

INSERT INTO [Lore].[Factions]
    ([Name],
    [Description])
VALUES(
        'Tamel Imperium',
        ''
);

INSERT INTO [Lore].[Factions]
    ([Name],
    [Description])
VALUES(
        'Doaverine Junta',
        ''
);

INSERT INTO [Lore].[Factions]
    ([Name],
    [Description])
VALUES(
        'Itamevoth Theocracy',
        ''
);

INSERT INTO [Lore].[Factions]
    ([Name],
    [Description])
VALUES(
        'Ghuzalterok Remnant',
        ''
);

INSERT INTO [Lore].[Factions]
    ([Name],
    [Description])
VALUES(
        'Inhaerent Custodium',
        ''
);

INSERT INTO [Lore].[Factions]
    ([Name],
    [Description])
VALUES(
        'Lurkers',
        ''
);

INSERT INTO [Lore].[Factions]
    ([Name],
    [Description])
VALUES(
        'Ordo Statera',
        ''
);

INSERT INTO [Lore].[Factions]
    ([Name],
    [Description])
VALUES(
        'Lex Ferra',
        ''
);

INSERT INTO [Lore].[Factions]
    ([Name],
    [Description])
VALUES(
        'Steel Triad',
        ''
);


/*
* Aritfacts
*/

INSERT INTO [Lore].[Artifacts]
    ([Name],
    [Description])
VALUES(
        'Terasu''s Rahaslicon',
        ''
);

INSERT INTO [Lore].[Artifacts]
    ([Name],
    [Description])
VALUES(
        'Veilith''s Spear',
        ''
);

INSERT INTO [Lore].[Artifacts]
    ([Name],
    [Description])
VALUES(
        'Inaru''s Chains',
        ''
);

INSERT INTO [Lore].[Artifacts]
    ([Name],
    [Description])
VALUES(
        'Iyla''s Ward',
        ''
);

INSERT INTO [Lore].[Artifacts]
    ([Name],
    [Description])
VALUES(
        'Tamauht''s Mirror',
        ''
);

INSERT INTO [Lore].[Artifacts]
    ([Name],
    [Description])
VALUES(
        'Zara Mazzallam',
        ''
);

INSERT INTO [Lore].[Artifacts]
    ([Name],
    [Description])
VALUES(
        'Iennialaed',
        ''
);

INSERT INTO [Lore].[Artifacts]
    ([Name],
    [Description])
VALUES(
        'Sha''Arhirm',
        ''
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
        '',
        4
);

INSERT INTO [Lore].[Resources]
    ([Name],
    [Description],
    [Rarity])
VALUES(
        'Lead',
        '',
        1
);

INSERT INTO [Lore].[Resources]
    ([Name],
    [Description],
    [Rarity])
VALUES(
        'Platinum',
        '',
        3
);

INSERT INTO [Lore].[Resources]
    ([Name],
    [Description],
    [Rarity])
VALUES(
        'Neairite',
        '',
        3
);

INSERT INTO [Lore].[Resources]
    ([Name],
    [Description],
    [Rarity])
VALUES(
        'Cinallis Poppy',
        '',
        2
);

INSERT INTO [Lore].[Resources]
    ([Name],
    [Description],
    [Rarity])
VALUES(
        'Monolis Flower',
        '',
        1
);

INSERT INTO [Lore].[Resources]
    ([Name],
    [Description],
    [Rarity])
VALUES(
        'Jaunes',
        '',
        1
);

INSERT INTO [Lore].[Resources]
    ([Name],
    [Description],
    [Rarity])
VALUES(
        'Nightshade',
        '',
        3
);

INSERT INTO [Lore].[Resources]
    ([Name],
    [Description],
    [Rarity])
VALUES(
        'Widow''s Veil',
        '',
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
        ''
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Sphere',
        ''
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Oversphere',
        ''
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Astral Space',
        ''
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Cycle',
        ''
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Cycle Velocity',
        ''
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Planar Delta',
        ''
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Absolute Delta',
        ''
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Planar Assignment',
        ''
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Planar Attraction',
        ''
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Planisphere',
        ''
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Manifold',
        ''
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Manifold Duct',
        ''
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'Far Realms',
        ''
);

INSERT INTO [Lore].[Terminologies]
    ([Name],
    [Definition])
VALUES(
        'The Expanse',
        ''
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
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Iyla',
        'Deity',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Veilith',
        'Deity',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Inaru',
        'Deity',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Terasu',
        'Deity',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Zhule',
        'Deity',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Rathak',
        'Deity',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Guhluk',
        'Deity',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Aihurem',
        'Dragon',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Astarot',
        'Dragon',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Geleondiril',
        'Dragon',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Lemanoth',
        'Celestial',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Marut''Apor',
        'Construct',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Marut''Laban',
        'Construct',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Xotlasihm',
        'Celestial',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Nulth',
        'Dragon',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Tamteru',
        'Deity',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Veilrak',
        'Deity',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Ilzu',
        'Deity',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Gunaruk',
        'Deity',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Balorok',
        'Primordial',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Atal',
        'Primordial',
        '',
        ''
);

INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Ehekator',
        'Primordial',
        '',
        ''
);


INSERT INTO [Lore].[NPCs]
    ([Name],
    [Race],
    [Description],
    [Biography])
VALUES(
        'Xallax',
        'Primordial',
        '',
        ''
);
