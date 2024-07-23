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
    Terminologies
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
        { "Terminologies", LoreTable.Terminologies }
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

            default:
                throw new NotSupportedException();
        }
    }
}
