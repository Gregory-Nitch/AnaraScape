namespace DataAccess.Models.LoreModels;

public class EventArtifactRelationModel(int eventId,
                                        int artifactId,
                                        string eventName,
                                        string artifactName)
{
    public int EventId { get; set; } = eventId;
    public int ArtifactId { get; set; } = artifactId;
    public string EventName { get; set; } = eventName;
    public string ArtifactName { get; set; } = artifactName;
}
