namespace DataAccess.Models.LoreModels;

public enum LoreTable
{
    Atrifacts,
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
        { "Artifacts", LoreTable.Atrifacts },
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
        { "BT_NPCFactionRealtions", LoreTable.BT_NPCFactionRelations },
    };

    public static readonly Dictionary<LoreTable, string> StoredProcessLoreMap = new()
    {
        { LoreTable.Atrifacts, "Lore.spArtifact_InsertArtifact" },
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

    public static Object GetLoreObject(LoreTable type)
    {
        switch(type)
        {
            case LoreTable.Atrifacts:
                return new LoadingArtifactModel("REQUIRED");

            case LoreTable.Events:
                return new LoadingEventModel("REQUIRED", false);

            case LoreTable.Factions:
                return new LoadingFactionModel("REQUIRED");
            
            case LoreTable.GeoMaps:
                return new LoadingGeoMapModel("REQUIRED", -1, "REQUIRED");

            case LoreTable.HistoricalAges:
                return new LoadingHistoricalAgeModel(AnaraAge.REQUIRED, "REQUIRED");

            case LoreTable.Locations:
                return new LoadingLocationModel("REQUIRED");

            case LoreTable.NPCs:
                return new LoadingNPCModel("REQUIRED", "REQUIRED", "REQUIRED", "REQUIRED");

            case LoreTable.Resources:
                return new LoadingResourceModel("REQUIRED");

            case LoreTable.Terminologies:
                return new LoadingTerminologyModel("REQUIRED");

            case LoreTable.BT_EventArtifactRelations:
                return new EventArtifactRelationModel(-1, -1);

            case LoreTable.BT_EventFactionRelations:
                return new EventFactionRelationModel(-1, -1);

            case LoreTable.BT_LocationEventRelations:
                return new LocationEventRelationModel(-1, -1);

            case LoreTable.BT_LocationFactionRelations:
                return new LocationFactionRelationModel(-1, -1);

            case LoreTable.BT_LocationResourceRelations:
                return new LocationResourceRelationModel(-1, -1);

            case LoreTable.BT_NPCEventRelations:
                return new NPCEventRelationModel(-1, -1);

            case LoreTable.BT_NPCFactionRelations:
                return new NPCFactionRelationModel(-1, -1);

            default:
                throw new NotSupportedException();
        }
    }
}
