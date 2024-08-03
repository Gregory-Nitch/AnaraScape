CREATE PROCEDURE [Lore].[spNPCs_UpdateById]
	@Id INT,
	@Name VARCHAR(100),
	@Race VARCHAR(30),
	@Description VARCHAR(MAX),
	@Biography VARCHAR(MAX),
	@Title VARCHAR(100),
	@LevelOrCR VARCHAR(6),
	@Speed INT,
	@HitPoints INT,
	@ArmorClass INT,
	@StatArray VARCHAR(36),
	@ProficiencyBonus INT,
	@SpellSaveDC INT,
	@SpellList VARCHAR(MAX),
	@SaveProficienciesList VARCHAR(MAX),
	@SkillProficienciesList VARCHAR(MAX),
	@ItemProficienciesList VARCHAR(MAX),
	@ActionList VARCHAR(MAX),
	@FeatureList VARCHAR(MAX),
	@EquipmentList VARCHAR(MAX),
	@LocationId INT,
	@BirthDate VARCHAR(MAX),
	@BirthAgeId INT,
	@DeathDate VARCHAR(MAX),
	@DeathAgeId INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Lore].[NPCs]
	SET
		[Name] = @Name,
		[Race] = @Race,
		[Description] = @Description,
		[Biography] = @Biography,
		[Title] = @Title,
		[LevelOrCR] = @LevelOrCR,
		[Speed] = @Speed,
		[HitPoints] = @HitPoints,
		[ArmorClass] = @ArmorClass,
		[StatArray] = @StatArray,
		[ProficiencyBonus] = @ProficiencyBonus,
		[SpellSaveDC] = @SpellSaveDC,
		[SpellList] = @SpellList,
		[SaveProficienciesList] = @SaveProficienciesList,
		[SkillProficienciesList] = @SkillProficienciesList,
		[ItemProficienciesList] = @ItemProficienciesList,
		[ActionList] = @ActionList,
		[FeatureList] = @FeatureList,
		[EquipmentList] = @EquipmentList,
		[LocationId] = @LocationId,
		[BirthDate] = @BirthDate,
		[BirthAgeId] = @BirthAgeId,
		[DeathDate] = @DeathDate,
		[DeathAgeId] = @DeathAgeId
	WHERE [Id] = @Id;

END
