namespace DataAccess.Models.LoreModels;


/// <summary>
/// Represents a NPC in the game setting.
/// </summary>
/// <param name="storedModel">stored model from the database</param>
public class NPCModel(StoredNPCModel storedModel)
{
    public int Id { get; set; } = storedModel.Id;
    public string Name { get; set; } = storedModel.Name;
    public string Race { get; set; } = storedModel.Race;
    public string Description { get; set; } = storedModel.Description;
    public string Biography { get; set; } = storedModel.Biography;
    public string? Title { get; set; } = storedModel?.Title;
    public string? LevelOrCR { get; set; } = storedModel?.LevelOrCR;
    public int? Speed { get; set; } = storedModel?.Speed;
    public int? HitPoints { get; set; } = storedModel?.HitPoints;
    public int? ArmorClass { get; set; } = storedModel?.ArmorClass;
    public string[]? StatArray { get; set; } = storedModel?.StatArray?.Split(',');
    public int? ProficiencyBonus { get; set; } = storedModel?.ProficiencyBonus;
    public int? SpellSaveDC { get; set; } = storedModel?.SpellSaveDC;
    public List<string>? SpellList { get; set; } = storedModel?.SpellList?.Split(",").ToList();
    public List<string>? SaveProficienciesList { get; set; } = storedModel?.SaveProficienciesList?
                                                                            .Split(",").ToList();
    public List<string>? SkillProficienciesList { get; set; } = storedModel?
                                                                .SkillProficienciesList?
                                                                .Split(",").ToList();
    public List<string>? ItemProficienciesList { get; set; } = storedModel?.ItemProficienciesList?
                                                                            .Split(",").ToList();
    public List<string>? ActionList { get; set; } = storedModel?.ActionList?.Split(",").ToList();
    public List<string>? FeatureList { get; set; } = storedModel?.FeatureList?.Split(",").ToList();
    public List<string>? EquipmentList { get; set; } = storedModel?.EquipmentList?.Split(",").ToList();
    public int? LocationId { get; set; } = storedModel?.LocationId; // FK (Locations)
    public AnaraDate? BirthDate { get; set; } = storedModel?.BirthDate != null ?
                                                AnaraDate.ParseFromString(storedModel.BirthDate) : null;
    public int? BirthAgeId { get; set; } = storedModel?.BirthAgeId; // FK (HistoricalAges)
    public AnaraDate? DeathDate { get; set; } = storedModel?.DeathDate != null ?
                                                AnaraDate.ParseFromString(storedModel.DeathDate) : null;
    public int? DeathAgeId { get; set; } = storedModel?.DeathAgeId; // FK (HistoricalAges)
}


/// <summary>
/// Represents a NPC while its being built (such as in the CLI tool).
/// </summary>
/// <param name="name">name of the npc</param>
/// <param name="race">race of the npc</param>
/// <param name="description">description of the npc</param>
/// <param name="biography">bio of the npc</param>
public class LoadingNPCModel(string name, string race, string description, string biography)
{
    public string Name { get; set; } = name;
    public string Race { get; set; } = race;
    public string Description { get; set; } = description;
    public string Biography { get; set; } = biography;
    public string? Title { get; set; }
    public string? LevelOrCR { get; set; }
    public int? Speed { get; set; }
    public int? HitPoints { get; set; }
    public int? ArmorClass { get; set; }
    public string? StatArray { get; set; }
    public int? ProficiencyBonus { get; set; }
    public int? SpellSaveDC { get; set; }
    public string? SpellList { get; set; }
    public string? SaveProficienciesList { get; set; }
    public string? SkillProficienciesList { get; set; }
    public string? ItemProficienciesList { get; set; }
    public string? ActionList { get; set; }
    public string? FeatureList { get; set; }
    public string? EquipmentList { get; set; }
    public int? LocationId { get; set; } // FK (Locations)
    public string? BirthDate { get; set; }
    public int? BirthAgeId { get; set; } // FK (HistoricalAges)
    public string? DeathDate { get; set; }
    public int? DeathAgeId { get; set; } // FK (HistoricalAges)
}


/// <summary>
/// Represents a NPC model in the database.
/// </summary>
/// <param name="id">id provided by database</param>
/// <param name="name">name of NPC</param>
/// <param name="race">the NPC's race</param>
/// <param name="description">description of NPC</param>
/// <param name="biography">bio of NPC</param>
/// <param name="title">title of NPC (king of X, etc)</param>
/// <param name="levelOrCR">level or CR of NPC (lvl3||cr3)</param>
/// <param name="speed">speed in feet</param>
/// <param name="hitPoints">hit points of the NPC (max)</param>
/// <param name="armorClass">armor class of NPC</param>
/// <param name="statArray">stats of the NPC in string form</param>
/// <param name="proficiencyBonus">proficiency bonus of the NPC</param>
/// <param name="spellSaveDC">spell save DC of the NPC's spells</param>
/// <param name="spellList">csv string of spell names</param>
/// <param name="saveProficienciesList">csv string of proficient saves</param>
/// <param name="skillProficienciesList">csv string of proficient skills</param>
/// <param name="itemProficienciesList">csv string of proficient items</param>
/// <param name="actionList">csv string of actions</param>
/// <param name="featureList">csv string of features</param>
/// <param name="equipmentList">csv string of equipment</param>
/// <param name="locationId">FK location id (Locations Table)</param>
/// <param name="birthDate">string representing an AnaraDate for a birth date</param>
/// <param name="birthAge">FK historical age id (HistoricalAges Table)</param>
/// <param name="deathDate">string representing an AnaraDate for a death date</param>
/// <param name="deathAge">FK historical age id (HistoricalAges Table)</param>
public class StoredNPCModel(int id,
                            string name,
                            string race,
                            string description,
                            string biography,
                            string? title,
                            string? levelOrCR,
                            int? speed,
                            int? hitPoints,
                            int? armorClass,
                            string? statArray,
                            int? proficiencyBonus,
                            int? spellSaveDC,
                            string? spellList,
                            string? saveProficienciesList,
                            string? skillProficienciesList,
                            string? itemProficienciesList,
                            string? actionList,
                            string? featureList,
                            string? equipmentList,
                            int? locationId,
                            string? birthDate,
                            int? birthAgeId,
                            string? deathDate,
                            int? deathAgeId)
{
    public int Id { get; set; } = id;
    public string Name { get; set; } = name;
    public string Race { get; set; } = race;
    public string Description { get; set; } = description;
    public string Biography { get; set; } = biography;
    public string? Title { get; set; } = title;
    public string? LevelOrCR { get; set; } = levelOrCR;
    public int? Speed { get; set; } = speed;
    public int? HitPoints { get; set; } = hitPoints;
    public int? ArmorClass { get; set; } = armorClass;
    public string? StatArray { get; set; } = statArray;
    public int? ProficiencyBonus { get; set; } = proficiencyBonus;
    public int? SpellSaveDC { get; set; } = spellSaveDC;
    public string? SpellList { get; set; } = spellList;
    public string? SaveProficienciesList { get; set; } = saveProficienciesList;
    public string? SkillProficienciesList { get; set; } = skillProficienciesList;
    public string? ItemProficienciesList { get; set; } = itemProficienciesList;
    public string? ActionList { get; set; } = actionList;
    public string? FeatureList { get; set; } = featureList;
    public string? EquipmentList { get; set; } = equipmentList;
    public int? LocationId { get; set; } = locationId; // FK Locations
    public string? BirthDate { get; set; } = birthDate;
    public int? BirthAgeId { get; set; } = birthAgeId; // FK HistoricalAges
    public string? DeathDate { get; set; } = deathDate;
    public int? DeathAgeId { get; set; } = deathAgeId; // FK HistoricalAges
}


/// <summary>
/// Represents a NPC in the game setting, including all of their relationships.
/// </summary>
/// <param name="id">id from db</param>
/// <param name="name">name of the npc</param>
/// <param name="race">race of the npc</param>
/// <param name="description">description of the npc</param>
/// <param name="biography">biography of the npc</param>
/// <param name="title">title that the npc holds</param>
/// <param name="levelOrCR">level or cr of the npc</param>
/// <param name="speed">movement speed of the npc</param>
/// <param name="hitPoints">max hit points of the npc</param>
/// <param name="armorClass">npc's armor class</param>
/// <param name="statArray">array of stats for the npc (str, dex, etc...)</param>
/// <param name="proficiencyBonus">proficiency bonus of the npc</param>
/// <param name="spellSaveDC">spell save dc of the npc's spells</param>
/// <param name="spellList">list of spell names the npc has access to</param>
/// <param name="saveProficienciesList">list of saves the npc is proficient in</param>
/// <param name="skillProficienciesList">list of skills the npc is proficient in</param>
/// <param name="itemProficienciesList">list of items the npc is proficient with</param>
/// <param name="actionList">list of actions the npc can take (attacks, hide, etc...)</param>
/// <param name="featureList">list of features the npc has</param>
/// <param name="equipmentList">list of equipment the npc has on them</param>
/// <param name="locationId">loction id where the npc normally resides(FK Locations)</param>
/// <param name="locationName">name of the location the npc normally resides</param>
/// <param name="birthDate">npc's date of birth</param>
/// <param name="birthAgeId">age id the npc was born in (FK HistoricalAges)</param>
/// <param name="birthAge">enum value representing the birth age</param>
/// <param name="deathDate">npc's date of death</param>
/// <param name="deathAgeId">age id the npc died in (FK HistoricalAges)</param>
/// <param name="deathAge">enum value representing the death age</param>
public class FullNPCModel(int id,
                          string name,
                          string race,
                          string description,
                          string biography,
                          string? title,
                          string? levelOrCR,
                          int? speed,
                          int? hitPoints,
                          int? armorClass,
                          string? statArray,
                          int? proficiencyBonus,
                          int? spellSaveDC,
                          string? spellList,
                          string? saveProficienciesList,
                          string? skillProficienciesList,
                          string? itemProficienciesList,
                          string? actionList,
                          string? featureList,
                          string? equipmentList,
                          int? locationId,
                          string? locationName,
                          string? birthDate,
                          int? birthAgeId,
                          AnaraAge? birthAge,
                          string? deathDate,
                          int? deathAgeId,
                          AnaraAge? deathAge)
{
    public int Id { get; set; } = id;
    public string Name { get; set; } = name;
    public string Race { get; set; } = race;
    public string Description { get; set; } = description;
    public string Biography { get; set; } = biography;
    public string? Title { get; set; } = title;
    public string? LevelOrCR { get; set; } = levelOrCR;
    public int? Speed { get; set; } = speed;
    public int? HitPoints { get; set; } = hitPoints;
    public int? ArmorClass { get; set; } = armorClass;
    public string[]? StatArray { get; set; } = statArray?.Split(',');
    public int? ProficiencyBonus { get; set; } = proficiencyBonus;
    public int? SpellSaveDC { get; set; } = spellSaveDC;
    public List<string>? SpellList { get; set; } = spellList?.Split(',').ToList();
    public List<string>? SaveProficienciesList { get; set; } = saveProficienciesList?.Split(',')
                                                                                     .ToList();
    public List<string>? SkillProficienciesList { get; set; } = skillProficienciesList?.Split(',')
                                                                                       .ToList();
    public List<string>? ItemProficienciesList { get; set; } = itemProficienciesList?.Split(',')
                                                                                     .ToList();
    public List<string>? ActionList { get; set; } = actionList?.Split(',').ToList();
    public List<string>? FeatureList { get; set; } = featureList?.Split(',').ToList();
    public List<string>? EquipmentList { get; set; } = equipmentList?.Split(',').ToList();
    public int? LocationId { get; set; } = locationId; // FK (Locations)
    public string? LocationName { get; set; } = locationName;
    public AnaraDate? BirthDate { get; set; } = birthDate != null ?
                                                AnaraDate.ParseFromString(birthDate) : null;
    public int? BirthAgeId { get; set; } = birthAgeId; // FK (HistoricalAges)
    public AnaraAge? BirthAge { get; } = birthAge;
    public AnaraDate? DeathDate { get; set; } = deathDate != null ?
                                                AnaraDate.ParseFromString(deathDate) : null;
    public int? DeathAgeId { get; set; } = deathAgeId; // FK (HistoricalAges)
    public AnaraAge? DeathAge { get; } = deathAge;
    public List<(int id, string name)> NotableLeadingFactions { get; set; } = [];
    public List<(int id, string name)> NotableMemberFactions { get; set; } = [];
    public List<(int id, string name)> NotableEvents { get; set; } = [];
    public List<(int id, string name)> NotableRulingLocations { get; set; } = [];
    public List<(int id, string name)> NotableCreatedArtifacts { get; set; } = [];
    public List<(int id, string name)> NotableOwnedArtifacts { get; set; } = [];
    public List<(int id, string name)> NotableTerms { get; set; } = [];
}