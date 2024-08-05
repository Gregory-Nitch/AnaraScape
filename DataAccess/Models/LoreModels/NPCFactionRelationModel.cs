namespace DataAccess.Models.LoreModels;


/// <summary>
/// Represents a NPC and faction relationship.
/// </summary>
/// <param name="npcId">npc id (FK NPCs)</param>
/// <param name="factionId">faction id (FK Factions)</param>
/// <param name="npcName">npc name from db</param>
/// <param name="factionName">faction name from db</param>
public class NPCFactionRelationModel(int npcId, int factionId, string npcName, string factionName)
{
    public int NPCId { get; set; } = npcId; // FK NPCs
    public int FactionId { get; set; } = factionId; // FK Factions
    public string NPCName { get; set; } = npcName;
    public string FactionName { get; set; } = factionName;
}


/// <summary>
/// Represents a NPC and faction relationship as it is being loaded.
/// </summary>
/// <param name="npcId">npc id (FK NPCs)</param>
/// <param name="factionId">faction id (FK Factions)</param>
public class LoadingNPCFactionRelationModel(int npcId, int factionId)
{
    public int NPCId { get; set; } = npcId; // FK NPCs
    public int FactionId { get; set; } = factionId; // FK Factions
}
