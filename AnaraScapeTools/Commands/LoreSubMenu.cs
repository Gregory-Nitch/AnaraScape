using Dapper;
using DataAccess;
using DataAccess.Models.LoreModels;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using System.Text;

namespace AnaraScapeTools.Commands;

public class LoreSubMenu(ICrud crud) : IToolCommand
{
    private readonly ICrud _crud = crud;

    public void Job()
    {
        string action = "";
        while (string.IsNullOrWhiteSpace(action))
        {
            action = GetCrudAction();
            if (action == "EXIT")
            {
                return;
            }
            LoreTable table = GetTable();

            switch (action)
            {
                case "insert":
                    BuildAndInsertLore(table);
                    break;

                case "select":
                    SelectLoreByTable(table);
                    break;

                case "update":
                    UpdateLoreEntry(table);
                    break;

                case "DELETE":
                    DeleteEntryLoreById(table);
                    break;

                case "EXIT":
                    return;

                default: // Should not be reachable due to GetCrudAction() checks
                    throw new ArgumentException($"ERR: Database action of '{action}' is invalid...");
            }
            action = "";
        }
    }

    private string GetCrudAction()
    {
        string? action = "";
        StringBuilder builder = new();
        builder.AppendLine("\n---Lore Submenu---");
        builder.AppendLine("\t1. insert");
        builder.AppendLine("\t2. select");
        builder.AppendLine("\t3. update");
        builder.AppendLine("\t4. DELETE");
        builder.AppendLine("\t5. EXIT");
        builder.Append("||> ");
        string submenu = builder.ToString();
        while (string.IsNullOrWhiteSpace(action))
        {
            Console.Write(submenu);
            action = Console.ReadLine();

            switch (action)
            {
                case "insert":
                case "select":
                case "update":
                case "DELETE":
                case "EXIT":
                    break;

                default:
                    Console.WriteLine("\nERR: Invalid request...");
                    action = "";
                    break;
            }
        }

        return action;
    }

    private LoreTable GetTable()
    {
        StringBuilder builder = new();
        builder.AppendLine("\n---Select Lore Table---");
        int i = 1;
        foreach (string k in LoreFactory.LoreTables.Keys)
        {
            builder.AppendLine($"\t{i++}. {k}");
        }
        builder.Append("||> ");

        string submenu = builder.ToString();
        string? table = "";
        while (string.IsNullOrWhiteSpace(table))
        {
            Console.Write(submenu);
            table = Console.ReadLine();
            if (table != null && !LoreFactory.LoreTables.ContainsKey(table))
            {
                Console.WriteLine("\nERR: Invalid table...");
                table = "";
            }
        }

        return LoreFactory.LoreTables[table];
    }

    private void BuildAndInsertLore(LoreTable table)
    {
        var obj = LoreFactory.GetLoreObject(table);
        var loreObj = Convert.ChangeType(obj, obj.GetType());
        var props = loreObj.GetType().GetProperties();
        List<string> propNames = [];
        foreach (var p in props)
        { 
            propNames.Add(p.Name);
        }
        string? colRequest = "";
        while (string.IsNullOrWhiteSpace(colRequest))
        {
            Console.Write(BuildObjData(obj, props, table));
            colRequest = Console.ReadLine();
            if (colRequest != null && colRequest == "EXIT")
            {
                return;
            }
            else if (colRequest != null && colRequest == "INSERT")
            {
                if (IsValidLoreObj(loreObj, props))
                {
                    try
                    {
                        _crud.InsertLore(loreObj, table);
                    }
                    catch (SqlException ex)
                    {
                        Console.WriteLine($"ERR: SQL entry error... {ex.Message}");
                        colRequest = "";
                    }
                }
                else
                {
                    Console.WriteLine("\nERR: There are still required columns for the chosen lore" +
                        " entry...");
                    colRequest = "";
                }
            }
            else if (colRequest != null && !propNames.Contains(colRequest))
            {
                Console.WriteLine("\nERR: Invalid column request...");
                colRequest = "";
            }
            else // Update working object
            {
                try
                {
                    var targetProp = props.Where(p => p.Name == colRequest).First();
                    var targetType = targetProp.PropertyType;
                    SetLoreObjProperty(loreObj, targetProp, targetType);
                }
                catch (InvalidCastException ex)
                {
                    Console.WriteLine($"\nERR: {ex.Message}...");
                }
                finally 
                {
                    colRequest = "";
                }
            }
        }
    }

    private bool IsValidLoreObj(object loreObj, PropertyInfo[] props)
    {
        bool isValid = true;
        foreach (PropertyInfo prop in props)
        {
            if (prop.PropertyType.IsEnum)
            {
                if (prop.GetValue(loreObj) != null && 
                    AnaraAge.REQUIRED == (AnaraAge)prop.GetValue(loreObj)!)
                {
                    isValid = false;
                }
            }
            else if (prop.GetValue(loreObj) != null &&
                prop.PropertyType == typeof(string) 
                && (string)prop.GetValue(loreObj)! == "REQUIRED")
            {
                isValid = false;
            }
            else if (prop.GetValue(loreObj) != null &&
                prop.PropertyType == typeof(int)
                && (int)prop.GetValue(loreObj)! == -1)
            {
                isValid = false;
            }
        }

        return isValid;
    }

    private void SetLoreObjProperty(object loreObj, PropertyInfo targetProp, Type targetType)
    {
        // Check for nullable types for casting
        if (targetProp.PropertyType.IsGenericType && 
            targetProp.PropertyType.GetGenericTypeDefinition().Equals(typeof(Nullable<>)))
        {
            targetType = Nullable.GetUnderlyingType(targetType)!;
        }

        Console.Write("\nInsert value ||> ");
        string? val = Console.ReadLine();
        try
        {
            // Check for enums and AnaraDate objects before general casting
            var casted = targetType.IsEnum ? Enum.Parse(targetType, val!) :
                                             Convert.ChangeType(val, targetType);
            targetProp.SetValue(loreObj, casted);
        }
        catch (InvalidCastException)
        {
            throw new InvalidCastException($"Could not cast {val} -> '{val!.GetType()}' to type " +
                $"'{targetType}'");
        } 
    }

    private string BuildObjData(object obj, PropertyInfo[] props, LoreTable table) 
    {
        if (obj == null)
        {
            throw new ArgumentNullException(nameof(obj), $"ERR: null reference on lore object...");
        }
        StringBuilder builder = new();
        builder.AppendLine($"\n---Lore {table} Entry---");
        foreach (var p in props)
        {
            builder.AppendLine($"\t{p.Name} : {p.GetValue(obj)}");
        }
        builder.AppendLine("(input column name or 'INSERT' to input to database or 'EXIT')");
        builder.Append("||> ");
        
        return builder.ToString();
    }

    private void SelectLoreByTable(LoreTable table) 
    {
        StringBuilder sb = new();
        switch (table)
        {
            case LoreTable.Artifacts:
                _crud.GetAllArtifacts().ForEach(obj => AddLoreObjectToDataString(sb, obj));
                break;

            case LoreTable.Events:
                _crud.GetAllEvents().ForEach(obj => AddLoreObjectToDataString(sb, obj));
                break;

            case LoreTable.Factions:
                _crud.GetAllFactions().ForEach(obj => AddLoreObjectToDataString(sb, obj));
                break;

            case LoreTable.GeoMaps:
                _crud.GetAllGeoMaps().ForEach(obj => AddLoreObjectToDataString(sb, obj));
                break;
            
            case LoreTable.HistoricalAges:
                _crud.GetAllHistoricalAges().ForEach(obj => AddLoreObjectToDataString(sb, obj));
                break;

            case LoreTable.Locations:
                _crud.GetAllLocations().ForEach(obj => AddLoreObjectToDataString(sb, obj));
                break;

            case LoreTable.NPCs:
                _crud.GetAllNPCs().ForEach(obj => AddLoreObjectToDataString(sb, obj));
                break;

            case LoreTable.Resources:
                _crud.GetAllResources().ForEach(obj => AddLoreObjectToDataString(sb, obj));
                break;

            case LoreTable.Terminologies:
                _crud.GetAllTerms().ForEach(obj => AddLoreObjectToDataString(sb, obj));
                break;

            case LoreTable.BT_EventArtifactRelations:
                _crud.GetAllEventArtifactRelations()
                     .ForEach(obj => AddLoreObjectToDataString(sb, obj));
                break;

            case LoreTable.BT_EventFactionRelations:
                _crud.GetAllEventFactionRelations()
                     .ForEach(obj => AddLoreObjectToDataString(sb, obj));
                break;

            case LoreTable.BT_LocationEventRelations:
                _crud.GetAllLocationEventRelations()
                     .ForEach(obj => AddLoreObjectToDataString(sb, obj));
                break;

            case LoreTable.BT_LocationFactionRelations:
                _crud.GetAllLocationFactionRelations()
                     .ForEach(obj => AddLoreObjectToDataString(sb, obj));
                break;

            case LoreTable.BT_LocationResourceRelations:
                _crud.GetAllLocationResourceRelations()
                     .ForEach(obj => AddLoreObjectToDataString(sb, obj));
                break;

            case LoreTable.BT_NPCEventRelations:
                _crud.GetAllNPCEventRelations().ForEach(obj => AddLoreObjectToDataString(sb, obj));
                break;

            case LoreTable.BT_NPCFactionRelations:
                _crud.GetAllNPCFactionRelations()
                     .ForEach(obj => AddLoreObjectToDataString(sb, obj));
                break;

            default:
                throw new NotSupportedException();
        }

        string data = sb.ToString();
        if (string.IsNullOrWhiteSpace(data))
        {
            Console.WriteLine($"\nLore Table {table} is empty...");
        }
        else
        {
            Console.WriteLine($"\n{data}");
        }
    }

    private void AddLoreObjectToDataString(StringBuilder sb, object loreObj)
    {// TODO Revisit here for proper table formating
        PropertyInfo[]? props = loreObj.GetType().GetProperties();
        foreach (var p in props)
        {
            sb.Append($"|{p.Name}|");
        }
        sb.AppendLine();
        foreach (var p in props)
        {
            sb.Append($"|{p.GetValue(loreObj)}|");
        }
        sb.AppendLine("\n--------------------------------------------------------------------------------");
    }

    private void UpdateLoreEntry(LoreTable table) 
    {
        throw new NotImplementedException();
    }

    private void DeleteEntryLoreById(LoreTable table) 
    {
        throw new NotImplementedException();
    }
}
