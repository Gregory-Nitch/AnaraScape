namespace DataAccess.Models.LoreModels;


/// <summary>
/// Represents a NPC and event relationship.
/// </summary>
/// <param name="npcId">npc id (FK NPCs)</param>
/// <param name="eventId">event id (FK Events)</param>
/// <param name="npcName">npc name from db</param>
/// <param name="eventName">event name from db</param>
public class NPCEventRelationModel(int npcId, int eventId, string npcName, string eventName)
{
    public int NPCId { get; set; } = npcId; // FK NPCs
    public int EventId { get; set; } = eventId; // FK Events
    public string NPCName { get; set; } = npcName;
    public string EventName { get; set; } = eventName;
}

public class LoadingNPCEventRelationModel(int npcId, int eventId)
{
    public int NPCId { get; set; } = npcId; // FK NPCs
    public int EventId { get; set; } = eventId; // FK Events
}
