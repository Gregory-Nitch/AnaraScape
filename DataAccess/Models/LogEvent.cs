using Microsoft.Extensions.Logging;

namespace DataAccess.Models;

/// <summary>
/// Represents an event that needed to be logged to the database.
/// </summary>
/// <param name="time">time event occured</param>
/// <param name="level">LogLevel of event</param>
/// <param name="message">event message</param>
public class LogEvent(DateTime time, LogLevel level, string message)
{
    public DateTime Time { get; set; } = time;
    public LogLevel Level { get; set; } = level;
    public string Message { get; set; } = message;

    public override string ToString()
    {
        return $"[{Level}] - Time: {Time} -- {Message}";
    }
}
