using DataAccess;
using DataAccess.Models.LoreModels;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using System.Text;

namespace AnaraScapeTools.Commands;

/// <summary>
/// Lore sub menu command allows insert, select, update and delete of lore db entries.
/// </summary>
/// <param name="crud">crud obj to execute sql on db</param>
public class LoreSubMenu(ICrud crud) : IToolCommand
{
    private readonly ICrud _crud = crud;

    /// <summary>
    /// Enters the lore sub menu and gets desired action from user.
    /// </summary>
    /// <exception cref="ArgumentException">thrown if produced action is not valid</exception>
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

    /// <summary>
    /// Gets the requested sql action from the user.
    /// </summary>
    /// <returns>should only return sql action strings or exit</returns>
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

    /// <summary>
    /// Gets the lore table the user wants execute sql upon.
    /// </summary>
    /// <returns>enum of LoreTable</returns>
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

    /// <summary>
    /// Performs delete, update, and insert sql actions based on parameters
    /// </summary>
    /// <param name="table">table to execute sql on</param>
    /// <param name="action">action to execute on table</param>
    /// <param name="obj">obj to use during execution(default null)</param>
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

    /// <summary>
    /// Checks if an object id is in the passed table, B Tables are routed to a different method.
    /// </summary>
    /// <param name="table">table to execute sql on</param>
    /// <param name="action">action to execute on table</param>
    /// <returns>object from table with requested id, or null if user requests exit</returns>
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

    /// <summary>
    /// Gets composite key ids from user and checks if an object with those ids is in the database.
    /// </summary>
    /// <param name="table">table to check for object</param>
    /// <returns>object with matching ids, or null if user requests exit</returns>
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

    /// <summary>
    /// Checks if the passed lore object has valid values prior to insert or update.
    /// </summary>
    /// <param name="loreObj">object to check</param>
    /// <param name="props">properties of passed object</param>
    /// <returns>boolean flag indicating a valid or invalid object</returns>
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

    /// <summary>
    /// Sets the passed object's property value as user's input.
    /// </summary>
    /// <param name="loreObj">object to update</param>
    /// <param name="targetProp">property to update</param>
    /// <param name="targetType">type of value required for property</param>
    /// <param name="table">table the object resides in</param>
    /// <param name="btIdMap">B Table id map (for B Tables only)</param>
    /// <exception cref="InvalidCastException"></exception>
    private void SetLoreObjProperty(object loreObj,
                                    PropertyInfo targetProp,
                                    Type targetType,
                                    LoreTable table,
                                    Dictionary<string, int> btIdMap)
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
            throw new InvalidCastException($"ERR: Could not cast {val} -> '{val!.GetType()}' to " +
                $"type '{targetType}'");
        } 
    }

    /// <summary>
    /// Builds the passed object's data as a string.
    /// </summary>
    /// <param name="obj">object to get data for</param>
    /// <param name="props">properties of the object</param>
    /// <param name="table">table the object resides in</param>
    /// <param name="action">desired action on the object</param>
    /// <returns>string of the object's data</returns>
    /// <exception cref="ArgumentNullException">thrown if passed object is null</exception>
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

    /// <summary>
    /// Gets all the objects in a requested table and builds a data sheet.
    /// </summary>
    /// <param name="table">table to select from</param>
    /// <exception cref="NotSupportedException">thrown if an invalid table is requested</exception>
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

    /// <summary>
    /// Adds an objects data to the passed string builder object. Used to build rows of sql select
    /// data sheets.
    /// </summary>
    /// <param name="sb">string builder object to build data in</param>
    /// <param name="loreObj">object to add data to string builder</param>
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
