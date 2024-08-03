namespace DataAccess.Models.LoreModels;

public enum LoreTable
{
    Artifacts,
    Events,
    Factions,
    GeoMaps,
    HistoricalAges,
    Locations,
    NPCs,
    Resources,
    Terminologies,
    BT_EventArtifactRelations,
    BT_EventFactionRelations,
    BT_LocationEventRelations,
    BT_LocationFactionRelations,
    BT_LocationResourceRelations,
    BT_NPCEventRelations,
    BT_NPCFactionRelations,
}

public class LoreFactory
{
    public static readonly Dictionary<string, LoreTable> LoreTables = new()
    {
        { "Artifacts", LoreTable.Artifacts },
        { "Events", LoreTable.Events },
        { "Factions", LoreTable.Factions },
        { "GeoMaps", LoreTable.GeoMaps },
        { "HistoricalAges", LoreTable.HistoricalAges },
        { "Locations", LoreTable.Locations },
        { "NPCs", LoreTable.NPCs },
        { "Resources", LoreTable.Resources },
        { "Terminologies", LoreTable.Terminologies },
        { "BT_EventArtifactRelations", LoreTable.BT_EventArtifactRelations },
        { "BT_EventFactionRelations", LoreTable.BT_EventFactionRelations },
        { "BT_LocationEventRelations", LoreTable.BT_LocationEventRelations },
        { "BT_LocationFactionRelations", LoreTable.BT_LocationFactionRelations },
        { "BT_LocationResourceRelations", LoreTable.BT_LocationResourceRelations },
        { "BT_NPCEventRelations", LoreTable.BT_NPCEventRelations },
        { "BT_NPCFactionRelations", LoreTable.BT_NPCFactionRelations },
    };

    public static readonly Dictionary<LoreTable, string> StoredProcedureInsertLoreMap = new()
    {
        { LoreTable.Artifacts, "Lore.spArtifacts_InsertArtifact" },
        { LoreTable.Events, "Lore.spEvents_InsertEvent" },
        { LoreTable.Factions, "Lore.spFactions_InsertFaction" },
        { LoreTable.GeoMaps, "Lore.spGeoMaps_InsertGeoMap" },
        { LoreTable.HistoricalAges, "Lore.spHistoricalAges_InsertHistoricalAge" },
        { LoreTable.Locations, "Lore.spLocations_InsertLocation" },
        { LoreTable.NPCs, "Lore.spNPCs_InsertNPC" },
        { LoreTable.Resources, "Lore.spResources_InsertResource" },
        { LoreTable.Terminologies, "Lore.spTerminologies_InsertTerm" },
        { LoreTable.BT_EventArtifactRelations, "Lore.spBT_EventArtifactRelations_InsertRelation" },
        { LoreTable.BT_EventFactionRelations, "Lore.spBT_EventFactionRelations_InsertRelation" },
        { LoreTable.BT_LocationEventRelations, "Lore.spBT_LocationEventRelations_InsertRelation" },
        { LoreTable.BT_LocationFactionRelations, "Lore.spBT_LocationFactionRelations_InsertRelation" },
        { LoreTable.BT_LocationResourceRelations, "Lore.spBT_LocationResourceRelations_InsertRelation" },
        { LoreTable.BT_NPCEventRelations, "Lore.spBT_NPCEventRelations_InsertRelation" },
        { LoreTable.BT_NPCFactionRelations, "Lore.spBT_NPCFactionRelations_InsertRelation" },
    };

    public static readonly Dictionary<LoreTable, string> StoredProcedureUpdateLoreMap = new()
    {
        { LoreTable.Artifacts, "Lore.spArtifacts_UpdateById" },
        { LoreTable.Events, "Lore.spEvents_UpdateById" },
        { LoreTable.Factions, "Lore.spFactions_UpdateById" },
        { LoreTable.GeoMaps, "Lore.spGeoMaps_UpdateById" },
        { LoreTable.HistoricalAges, "Lore.spHistoricalAges_UpdateById" },
        { LoreTable.Locations, "Lore.spLocations_UpdateById" },
        { LoreTable.NPCs, "Lore.spNPCs_UpdateById" },
        { LoreTable.Resources, "Lore.spResources_UpdateById" },
        { LoreTable.Terminologies, "Lore.spTerminologies_UpdateById" },
        { LoreTable.BT_EventArtifactRelations, "Lore.spBT_EventArtifactRelations_UpdateByCK" },
        { LoreTable.BT_EventFactionRelations, "Lore.spBT_EventFactionRelations_UpdateByCK" },
        { LoreTable.BT_LocationEventRelations, "Lore.spBT_LocationEventRelations_UpdateByCK" },
        { LoreTable.BT_LocationFactionRelations, "Lore.spBT_LocationFactionRelations_UpdateByCK" },
        { LoreTable.BT_LocationResourceRelations, "Lore.spBT_LocationResourceRelations_UpdateByCK" },
        { LoreTable.BT_NPCEventRelations, "Lore.spBT_NPCEventRelations_UpdateByCK" },
        { LoreTable.BT_NPCFactionRelations, "Lore.spBT_NPCFactionRelations_UpdateByCK" },
    };

    public static readonly Dictionary<LoreTable, Type> LoreTypeMap = new()
    {
        { LoreTable.Artifacts, typeof(StoredArtifactModel) },
        { LoreTable.Events, typeof(StoredEventModel) },
        { LoreTable.Factions, typeof(StoredFactionModel) },
        { LoreTable.GeoMaps, typeof(GeoMapModel) },
        { LoreTable.HistoricalAges, typeof(HistoricalAgeModel) },
        { LoreTable.Locations, typeof(LocationModel) },
        { LoreTable.NPCs, typeof(StoredNPCModel) },
        { LoreTable.Resources, typeof(ResourceModel) },
        { LoreTable.Terminologies, typeof(TerminologyModel) },
        { LoreTable.BT_EventArtifactRelations, typeof(LoadingEventArtifactRelationModel) },
        { LoreTable.BT_EventFactionRelations, typeof(LoadingEventFactionRelationModel) },
        { LoreTable.BT_LocationEventRelations, typeof(LoadingLocationEventRelationModel) },
        { LoreTable.BT_LocationFactionRelations, typeof(LoadingLocationFactionRelationModel) },
        { LoreTable.BT_LocationResourceRelations, typeof(LoadingLocationResourceRelationModel) },
        { LoreTable.BT_NPCEventRelations, typeof(LoadingNPCEventRelationModel) },
        { LoreTable.BT_NPCFactionRelations, typeof(LoadingNPCFactionRelationModel) },
    };

    public static object GetLoreObject(LoreTable enumType)
    {
        return enumType switch
        {
            LoreTable.Artifacts => new LoadingArtifactModel("REQUIRED"),
            LoreTable.Events => new LoadingEventModel("REQUIRED", false),
            LoreTable.Factions => new LoadingFactionModel("REQUIRED"),
            LoreTable.GeoMaps => new LoadingGeoMapModel("REQUIRED", -1, "REQUIRED"),
            LoreTable.HistoricalAges => new LoadingHistoricalAgeModel(AnaraAge.REQUIRED, "REQUIRED"),
            LoreTable.Locations => new LoadingLocationModel("REQUIRED"),
            LoreTable.NPCs => new LoadingNPCModel("REQUIRED", "REQUIRED", "REQUIRED", "REQUIRED"),
            LoreTable.Resources => new LoadingResourceModel("REQUIRED"),
            LoreTable.Terminologies => new LoadingTerminologyModel("REQUIRED"),
            LoreTable.BT_EventArtifactRelations => 
                new LoadingEventArtifactRelationModel(-1, -1),
            LoreTable.BT_EventFactionRelations => 
                new LoadingEventFactionRelationModel(-1, -1),
            LoreTable.BT_LocationEventRelations => 
                new LoadingLocationEventRelationModel(-1, -1),
            LoreTable.BT_LocationFactionRelations => 
                new LoadingLocationFactionRelationModel(-1, -1),
            LoreTable.BT_LocationResourceRelations => 
                new LoadingLocationResourceRelationModel(-1, -1),
            LoreTable.BT_NPCEventRelations => 
                new LoadingNPCEventRelationModel(-1, -1),
            LoreTable.BT_NPCFactionRelations => 
                new LoadingNPCFactionRelationModel(-1, -1),
            _ => throw new NotSupportedException(),
        };
    }

    public static object? GetDBLoreObject(LoreTable enumType,
                                          Dictionary<string, int> idMap,
                                          ICrud crud)
    {
        return enumType switch
        {
            LoreTable.Artifacts => crud.GetStoredArtifactById(idMap["PK"]),
            LoreTable.Events => crud.GetStoredEventById(idMap["PK"]),
            LoreTable.Factions => crud.GetStoredFactionById(idMap["PK"]),
            LoreTable.GeoMaps => crud.GetGeoMapById(idMap["PK"]),
            LoreTable.HistoricalAges => crud.GetHistoricalAgeById(idMap["PK"]),
            LoreTable.Locations => crud.GetLocationById(idMap["PK"]),
            LoreTable.NPCs => crud.GetStoredNPCById(idMap["PK"]),
            LoreTable.Resources => crud.GetResourceById(idMap["PK"]),
            LoreTable.Terminologies => crud.GetStoredTerminologyById(idMap["PK"]),
            LoreTable.BT_EventArtifactRelations =>
                crud.GetEventArtifactRelationByCompositeId(idMap["EventId"], idMap["ArtifactId"]),
            LoreTable.BT_EventFactionRelations =>
                crud.GetEventFactionRelationByCompositeId(idMap["EventId"], idMap["FactionId"]),
            LoreTable.BT_LocationEventRelations =>
                crud.GetLocationEventRelationByCompositeId(idMap["LocationId"], idMap["EventId"]),
            LoreTable.BT_LocationFactionRelations =>
                crud.GetLocationFactionRelationByCompositeId(idMap["LocationId"], idMap["FactionId"]),
            LoreTable.BT_LocationResourceRelations =>
                crud.GetLocationResourceRelationByCompositeId(idMap["LocationId"], idMap["ResourceId"]),
            LoreTable.BT_NPCEventRelations =>
                crud.GetNPCEventRelationByCompositeId(idMap["NPCId"], idMap["EventId"]),
            LoreTable.BT_NPCFactionRelations =>
                crud.GetNPCFactionRelationByCompositeId(idMap["NPCId"], idMap["FactionId"]),
            _ => throw new NotSupportedException(),
        };
    }

    public static void RouteBTableUpdateLoreObject(LoreTable table,
                                                   Dictionary<string, int> btIdMap,
                                                   ICrud crud)
    {
        switch (table)
        {
            case LoreTable.BT_EventArtifactRelations:
                
                crud.UpdateEventArtifactRelationByCompositeId(btIdMap["EventId"],
                                                              btIdMap["ArtifactId"],
                                                              btIdMap["OldEventId"],
                                                              btIdMap["OldArtifactId"]);
                break;

            case LoreTable.BT_EventFactionRelations:
                crud.UpdateEventFactionRelationByCompositeId(btIdMap["EventId"],
                                                             btIdMap["FactionId"],
                                                             btIdMap["OldEventId"],
                                                             btIdMap["OldFactionId"]);
                break;

            case LoreTable.BT_LocationEventRelations:
                crud.UpdateLocationEventRelationByCompositeId(btIdMap["LocationId"],
                                                              btIdMap["EventId"],
                                                              btIdMap["OldLocationId"],
                                                              btIdMap["OldEventId"]);
                break;

            case LoreTable.BT_LocationFactionRelations:
                crud.UpdateLocationFactionRelationByCompositeId(btIdMap["LocationId"], 
                                                                btIdMap["FactionId"],
                                                                btIdMap["OldLocationId"],
                                                                btIdMap["OldFactionId"]);
                break;

            case LoreTable.BT_LocationResourceRelations:
                crud.UpdateLocationResourceRelationByCompositeId(btIdMap["LocationId"], 
                                                                 btIdMap["ResourceId"],
                                                                 btIdMap["OldLocationId"],
                                                                 btIdMap["OldResourceId"]);
                break;

            case LoreTable.BT_NPCEventRelations:
                crud.UpdateNPCEventRelationsByCompositeId(btIdMap["NPCId"],
                                                          btIdMap["EventId"],
                                                          btIdMap["OldNPCId"],
                                                          btIdMap["OldEventId"]);

                break;

            case LoreTable.BT_NPCFactionRelations:
                crud.UpdateNPCFactionRelationByCompositeId(btIdMap["NPCId"], 
                                                           btIdMap["FactionId"],
                                                           btIdMap["OldNPCId"],
                                                           btIdMap["OldFactionId"]);
                break;

            default:
                throw new NotImplementedException();
        }
    }

    public static void RouteBTableDeleteLoreObject(LoreTable table,
                                                   Dictionary<string, int> btIdMap,
                                                   ICrud crud)
    {
        switch (table)
        {
            case LoreTable.BT_EventArtifactRelations:

                crud.DeleteEventArtifactRelationByCompositeId(btIdMap["EventId"],
                                                              btIdMap["ArtifactId"]);
                break;

            case LoreTable.BT_EventFactionRelations:
                crud.DeleteEventFactionRelationByCompositeId(btIdMap["EventId"],
                                                             btIdMap["FactionId"]);
                break;

            case LoreTable.BT_LocationEventRelations:
                crud.DeleteLocationEventRelationByCompositeId(btIdMap["LocationId"],
                                                              btIdMap["EventId"]);
                break;

            case LoreTable.BT_LocationFactionRelations:
                crud.DeleteLocationFactionRelationByCompositeId(btIdMap["LocationId"],
                                                                btIdMap["FactionId"]);
                break;

            case LoreTable.BT_LocationResourceRelations:
                crud.DeleteLocationResourceRelationByCompositeId(btIdMap["LocationId"],
                                                                 btIdMap["ResourceId"]);
                break;

            case LoreTable.BT_NPCEventRelations:
                crud.DeleteNPCEventRelationsByCompositeId(btIdMap["NPCId"],
                                                          btIdMap["EventId"]);

                break;

            case LoreTable.BT_NPCFactionRelations:
                crud.DeleteNPCFactionRelationByCompositeId(btIdMap["NPCId"],
                                                           btIdMap["FactionId"]);
                break;

            default:
                throw new NotImplementedException();
        }
    }
}
