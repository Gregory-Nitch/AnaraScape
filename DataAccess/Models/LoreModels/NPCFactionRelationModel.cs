namespace DataAccess.Models.LoreModels;

public class NPCFactionRelationModel(int npcId, int factionId, string npcName, string factionName)
{
    public int NPCId { get; set; } = npcId;
    public int FactionId { get; set; } = factionId;
    public string NPCName { get; set; } = npcName;
    public string FactionName { get; set; } = factionName;
}

public class LoadingNPCFactionRelationModel(int npcId, int factionId)
{
    public int NPCId { get; set; } = npcId;
    public int FactionId { get; set; } = factionId;
}
