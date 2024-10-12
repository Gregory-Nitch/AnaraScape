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
        'Acies is located in the South of the Western hemisphere (Acient) and is known for its relatively flat and open landscape, along with some of the oldest surviving structures on Anara. Acies is ruled by the Itamevoth Theocracy and its people heavily influenced by the worship of the good aligned gods of Anara. These religious beliefs have fueled the constant skirmishes and crusades since the Dark Age against the people of Krukiathu to the north who openly worship the dark gods. The most notable land marks are the Scalar Patha, The Luk''Teph Dessert, and the city Novum.',
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
