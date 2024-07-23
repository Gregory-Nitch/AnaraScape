namespace DataAccess.Models.LoreModels;

public class NPCEventRelationModel(int npcId, int eventId)
{
    public int NPCId { get; set; } = npcId;
    public int EventId { get; set; } = eventId;
}
