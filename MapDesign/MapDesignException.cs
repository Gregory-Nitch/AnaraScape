namespace MapDesignLibrary;

/// <summary>
/// Exception thrown when a MapDesigner class has been found to reach an invalid map state, 
/// normally found during the AStar method call which checks that a tile is reachable from
/// the map's entrance.
/// </summary>
[Serializable]
public class MapDesignException : Exception
{
    public MapDesignException() { }

    public MapDesignException(string message) : base(message) { }

    public MapDesignException(string message, Exception innerException)
        : base(message, innerException) { }
}
