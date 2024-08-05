namespace DataAccess.Models.LoreModels;

/// <summary>
/// Represents a relationship between an event and artifact.
/// </summary>
/// <param name="eventId">id of the event (FK Events)</param>
/// <param name="artifactId">id of the artifact (FK Artifacts)</param>
/// <param name="eventName">name of the event from the db</param>
/// <param name="artifactName">name of the artifact from the db</param>
public class EventArtifactRelationModel(int eventId,
                                        int artifactId,
                                        string eventName,
                                        string artifactName)
{
    public int EventId { get; set; } = eventId; // FK Events
    public int ArtifactId { get; set; } = artifactId; // FK Artifacts
    public string EventName { get; set; } = eventName;
    public string ArtifactName { get; set; } = artifactName;
}


/// <summary>
/// Represents a event and artifact relationship as it is being loaded (no names).
/// </summary>
/// <param name="eventId">event id (FK Events)</param>
/// <param name="artifactId">artifact id (FK Artifacts)</param>
public class LoadingEventArtifactRelationModel(int eventId, int artifactId)
{
    public int EventId { get; set; } = eventId; // FK Events
    public int ArtifactId { get; set; } = artifactId; // FK Artifacts
}
