namespace DataAccess.Models.LoreModels;

public class NPCFactionRelationModel(int npcId, int factionId)
{
    public int NPCId { get; set; } = npcId;
    public int FactionId { get; set; } = factionId;
}
