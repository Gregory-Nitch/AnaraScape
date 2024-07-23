namespace DataAccess.Models.LoreModels;

public class EventArtifactRelationModel(int eventId, int artifactId)
{
    public int EventId { get; set; } = eventId;
    public int ArtifactId { get; set; } = artifactId;
}
