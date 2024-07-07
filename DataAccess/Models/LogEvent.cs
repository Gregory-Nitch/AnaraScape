
using Microsoft.Extensions.Logging;

namespace DataAccess.Models;
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
