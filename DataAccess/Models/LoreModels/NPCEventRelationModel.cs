namespace DataAccess.Models.LoreModels;

public class NPCEventRelationModel(int npcId, int eventId, string npcName, string eventName)
{
    public int NPCId { get; set; } = npcId;
    public int EventId { get; set; } = eventId;
    public string NPCName { get; set; } = npcName;
    public string EventName { get; set; } = eventName;
}
