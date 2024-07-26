CREATE PROCEDURE [Lore].[spNPCs_SelectAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[Id],
		[Name],
		[Race],
		[Description],
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
		[BirthDate],
		[BirthAgeId],
		[DeathDate],
		[DeathAgeId]
  FROM [Lore].[NPCs];

END
