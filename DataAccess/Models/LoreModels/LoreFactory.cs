using System.Security.AccessControl;

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

    public static readonly Dictionary<LoreTable, string> StoredProcessLoreMap = new()
    {
        { LoreTable.Artifacts, "Lore.spArtifact_InsertArtifact" },
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
        { LoreTable.BT_EventArtifactRelations, typeof(EventArtifactRelationModel) },
        { LoreTable.BT_EventFactionRelations, typeof(EventFactionRelationModel) },
        { LoreTable.BT_LocationEventRelations, typeof(LocationEventRelationModel) },
        { LoreTable.BT_LocationFactionRelations, typeof(LocationFactionRelationModel) },
        { LoreTable.BT_LocationResourceRelations, typeof(LocationResourceRelationModel) },
        { LoreTable.BT_NPCEventRelations, typeof(NPCEventRelationModel) },
        { LoreTable.BT_NPCFactionRelations, typeof(NPCFactionRelationModel) },
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
                new EventArtifactRelationModel(-1, -1, "REQUIRED", "REQUIRED"),
            LoreTable.BT_EventFactionRelations => 
                new EventFactionRelationModel(-1, -1,"REQUIRED", "REQUIRED"),
            LoreTable.BT_LocationEventRelations => 
                new LocationEventRelationModel(-1, -1, "REQUIRED", "REQUIRED"),
            LoreTable.BT_LocationFactionRelations => 
                new LocationFactionRelationModel(-1, -1, "REQUIRED", "REQUIRED"),
            LoreTable.BT_LocationResourceRelations => 
                new LocationResourceRelationModel(-1, -1, "REQUIRED", "REQUIRED"),
            LoreTable.BT_NPCEventRelations => 
                new NPCEventRelationModel(-1, -1, "REQUIRED", "REQUIRED"),
            LoreTable.BT_NPCFactionRelations => 
                new NPCFactionRelationModel(-1, -1, "REQUIRED", "REQUIRED"),
            _ => throw new NotSupportedException(),
        };
    }
}
