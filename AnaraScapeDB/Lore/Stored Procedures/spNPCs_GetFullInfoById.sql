CREATE PROCEDURE [Lore].[spNPCs_GetFullInfoById]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    [NPCs].[Id],
    [NPCs].[Name],
    [Race],
    [NPCs].[Description],
    [Biography],
    [Title],
    [LevelOrCR],
    [Speed],
    [HitPoints],
    [ArmorClass],
    [StatArray],
    [ProficiencyBonus],
    [SpellSaveDC],
    [SpellList],
    [SaveProficienciesList],
    [SkillProficienciesList],
    [ItemProficienciesList],
    [ActionList],
    [FeatureList],
    [EquipmentList],
    [LocationId],
    [Locations].[Name] AS [LocationName],
    [BirthDate],
    [BirthAgeId],
    (SELECT TOP 1
      [Age]
    FROM [Lore].[HistoricalAges]
    WHERE [HistoricalAges].[Id] = [BirthAgeId]) AS [BirthAge],
    [DeathDate],
    [DeathAgeId],
    (SELECT TOP 1
      [Age]
    FROM [Lore].[HistoricalAges]
    WHERE [HistoricalAges].[Id] = [DeathAgeId]) AS [DeathAge]
  FROM [Lore].[NPCs]
    FULL JOIN [Lore].[Locations] ON ([Locations].[Id] = [LocationId])
  WHERE [NPCs].[Id] = @Id;

END
