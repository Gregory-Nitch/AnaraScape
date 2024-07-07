
using DataAccess;
using DataAccess.Models;
using System.Globalization;
using System.Text;

namespace AnaraScapeTools.Commands;

public class GetLogs(ICrud crud) : IToolCommand
{
    private readonly ICrud _crud = crud;

    private static string GetLogRequestInput()
    {
        string? logRequest = "";
        StringBuilder getLogSubMenu = new();
        getLogSubMenu.AppendLine("\nEnter log request:");
        getLogSubMenu.AppendLine("\tget-all-logs");
        getLogSubMenu.AppendLine("\tget-logs-after");
        getLogSubMenu.AppendLine("\tget-logs-before");
        getLogSubMenu.AppendLine("\tget-logs-ranged");
        getLogSubMenu.AppendLine("\tABORT");
        getLogSubMenu.Append("||> ");

        while (string.IsNullOrWhiteSpace(logRequest))
        {
            Console.Write(getLogSubMenu.ToString());

            logRequest = Console.ReadLine();

            switch (logRequest)
            {
                case "get-all-logs":
                    break;

                case "get-logs-after":
                    break;
                    

                case "get-logs-before":
                    break;

                case "get-logs-ranged":
                    break;

                case "ABORT":
                    break;

                default:
                    Console.WriteLine("\nERR: invalid subcommand...\n");
                    logRequest = "";
                    break;
            }
        }
        return logRequest;
    }

    private static DateTime GetDate(string dateMessage)
    {
        bool invalidDate = true;
        while (invalidDate)
        {
            Console.WriteLine($"\nInput {dateMessage} (YYYY-MM-DD) [@00:00hrs]");
            Console.Write("||> ");
            if (DateTime.TryParse(Console.ReadLine(),
                                  DateTimeFormatInfo.CurrentInfo,
                                  out DateTime date))
            {
                return date;
            }
            else
            {
                Console.WriteLine("ERR: invalid date input...");
            }
        }
        throw new NullReferenceException("ERR: GetDate() tried exiting with no date...");
    }

    public void Job()
    {
        List<LogEvent> logs;
        switch (GetLogRequestInput())
        {
            case "get-all-logs":
                logs = _crud.GetAllLogEvents();
                break;

            case "get-logs-after":
                logs = _crud.GetLogsAfter(GetDate("beginning date"));
                break;

            case "get-logs-before":
                logs = _crud.GetLogsBefore(GetDate("ending date"));
                break;

            case "get-logs-ranged":
                logs = _crud.GetLogsInRange(GetDate("beginning date"), GetDate("ending date"));
                break;

            default:
                Console.WriteLine("\nAborting...");
                return;
        }

        if (logs.Count == 0)
        {
            Console.WriteLine("\nNo logs found...");
            return;
        }

        foreach (LogEvent log in logs)
        {
            Console.WriteLine($"\n{log}");
        }

        CheckWriteToFile(logs);
    }

    private static void CheckWriteToFile(List<LogEvent> logs)
    {
        string writeToFileReq = "";
        while (string.IsNullOrWhiteSpace(writeToFileReq))
        {
            Console.WriteLine("\nWrite these logs to a file? (y/n)");
            Console.Write("||> ");
            writeToFileReq = Console.ReadLine()!.ToLower();

            switch (writeToFileReq)
            {
                case "n":
                    return;

                case "y":
                    break; // Exits while loop

                default:
                    Console.WriteLine("\nERR: Invalid input...");
                    writeToFileReq = "";
                    break;
            }
        }

        Console.WriteLine("\nWriting to file...");
        StringBuilder sb = new();
        foreach (LogEvent log in logs)
        {
            sb.AppendLine(log.ToString());
            sb.AppendLine();
        }
        File.WriteAllText($"./LogsOut/logs-request-{DateOnly.FromDateTime(DateTime.Now.Date)}.log", sb.ToString());
    }
}
