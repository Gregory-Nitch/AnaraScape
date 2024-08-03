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
            if (string.Equals(action, "EXIT"))
            {
                return;
            }
            LoreTable table = GetTable();

            switch (action)
            {
                case "insert":
                    var obj = LoreFactory.GetLoreObject(table);
                    BuildAndDeUpsertLore(table, "INSERT", obj);
                    break;

                case "select":
                    SelectLoreByTable(table);
                    break;

                case "update":
                    BuildAndDeUpsertLore(table, "UPDATE");
                    break;

                case "DELETE":
                    BuildAndDeUpsertLore(table, "DELETE");
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

    private void BuildAndDeUpsertLore(LoreTable table, string action, object? obj = null)
    {
        obj ??= GetIdFromUserAndCheckDB(table, action);
        if (obj == null)
        {
            Console.WriteLine($"\nAborting {action}...");
            return;
        }

        var loreObj = Convert.ChangeType(obj, obj.GetType());
        var props = loreObj.GetType().GetProperties();
        List<string> propNames = [];
        Dictionary<string, int> btIdMap = [];
        foreach (var p in props)
        {
            // Store old ids for B table updating
            if (table > LoreTable.Terminologies && p.Name.EndsWith("Id"))
            {
                btIdMap[p.Name] = (int)p.GetValue(loreObj)!; // Prevents missing keys during update
                btIdMap["Old" + p.Name] = (int)p.GetValue(loreObj)!;
            }
            propNames.Add(p.Name);
        }
        string? colRequest = "";
        while (string.IsNullOrWhiteSpace(colRequest))
        {
            Console.Write(BuildObjData(loreObj, props, table, action));
            colRequest = Console.ReadLine();
            if (colRequest != null && string.Equals(colRequest, "EXIT"))
            {
                return;
            }
            else if (colRequest != null && string.Equals(colRequest, action))
            {
                if (IsValidLoreObj(loreObj, props))
                {
                    try
                    {
                        if (string.Equals(action, "UPDATE") && table <= LoreTable.Terminologies)
                        {
                            _crud.UpdateLore(loreObj, table);
                        }
                        else if (string.Equals(action, "UPDATE") && table > LoreTable.Terminologies)
                        {
                            LoreFactory.RouteBTableUpdateLoreObject(table, btIdMap, _crud);
                        }
                        else if (string.Equals(action, "DELETE") && table <= LoreTable.Terminologies)
                        {
                            _crud.DeleteLoreById((int)loreObj.GetType()
                                                             .GetProperty("Id")!
                                                             .GetValue(loreObj)!, table);
                        }
                        else if (string.Equals(action, "DELETE") && table > LoreTable.Terminologies)
                        {
                            LoreFactory.RouteBTableDeleteLoreObject(table, btIdMap, _crud);
                        }
                        else if (string.Equals(action, "INSERT"))
                        {
                            _crud.InsertLore(loreObj, table);
                        }
                    }
                    catch (SqlException ex)
                    {
                        Console.WriteLine($"ERR: SQL execution error... {ex.Message}");
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
            else if(!string.Equals(action, "DELETE")) // Update working object
            {
                try
                {
                    var targetProp = props.Where(p => p.Name == colRequest).First();
                    var targetType = targetProp.PropertyType;
                    SetLoreObjProperty(loreObj, targetProp, targetType, table, btIdMap);
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
            else
            {
                Console.WriteLine("\nERR: Invalid request...");
                colRequest = "";
            }
        }
    }

    private object? GetIdFromUserAndCheckDB(LoreTable table, string action)
    {
        // Handle B Tables separately
        if (table > LoreTable.Terminologies)
        {
            return GetIdsForBTableObjectAndCheckDB(table);
        }

        Dictionary<string, int> idMap = new()
            { {"PK", 0 } };
        while (idMap["PK"] == 0)
        {
            Console.Write($"\nInsert Id for row in {table} to {action} (or EXIT):\n||> ");
            string input = Console.ReadLine()!;
            if (int.TryParse(input, out int id))
            {
                idMap["PK"] = id;
                object? obj = LoreFactory.GetDBLoreObject(table, idMap, _crud);
                if (obj == null)
                {
                    Console.WriteLine($"\nNo entry found with the Id = {idMap["PK"]}!");
                    idMap["PK"] = 0;
                    continue;
                }
                return obj;
            }
            else if (string.Equals(input, "EXIT"))
            {
                break;
            }
            else
            {
                Console.WriteLine("ERR: Invalid entry, enter an int...");
            }
        }
        return null;
    }

    private object? GetIdsForBTableObjectAndCheckDB(LoreTable table)
    {
        Dictionary<string, int> ids = [];
        Type type = LoreFactory.LoreTypeMap[table];
        var props = type.GetProperties();
        bool invalidObj = true;
        while (invalidObj)
        {
            foreach (var prop in props)
            {
                if (prop.PropertyType != typeof(int))
                {
                    continue;
                }
                int id = 0;
                while (id == 0)
                {
                    Console.Write($"\nEnter Id for {prop.Name} (or EXIT):\n||> ");
                    string input = Console.ReadLine()!;
                    if (int.TryParse(input, out id))
                    {
                        ids[prop.Name] = id;
                    }
                    else if (string.Equals(input, "EXIT"))
                    {
                        return null;
                    }
                    else
                    {
                        Console.WriteLine("ERR: Invalid entry, enter an int...");
                    }
                }
            }

            object? obj = LoreFactory.GetDBLoreObject(table, ids, _crud);
            if (obj == null)
            {
                StringBuilder sb = new();
                sb.Append("\nNo entry found with the Ids: ");
                foreach (var key in ids.Keys)
                {
                    sb.Append($"{key} = {ids[key]} ");
                }
                sb.Append('!');
                Console.WriteLine(sb.ToString());
                continue;
            }
            return obj;

        }
        return null;
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

    private void SetLoreObjProperty(object loreObj, PropertyInfo targetProp, Type targetType, LoreTable table, Dictionary<string, int> btIdMap)
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
            // Store new ids for B table updating
            if (table > LoreTable.Terminologies && targetProp.Name.EndsWith("Id"))
            {
                btIdMap[targetProp.Name] = (int)targetProp.GetValue(loreObj)!;
            }
        }
        catch (InvalidCastException)
        {
            throw new InvalidCastException($"Could not cast {val} -> '{val!.GetType()}' to type " +
                $"'{targetType}'");
        } 
    }

    private string BuildObjData(object obj, PropertyInfo[] props, LoreTable table, string action) 
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
        builder.Append("(input ");
        if (!string.Equals(action, "DELETE"))
        {
            builder.Append("column name or ");
        }
        builder.AppendLine($"'{action}' to execute on database or 'EXIT')");
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
    {// TODO Revisit here for proper table formatting
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
}
