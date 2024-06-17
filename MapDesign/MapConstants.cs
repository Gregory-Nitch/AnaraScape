
namespace MapDesignLibrary;

/// <summary>
/// Contains all of the constants for the MapDesigner class.
/// </summary>
internal static class MapConstants
{

    public static readonly int TILE_SIZE = 2048;

    public static readonly string[] TOP_CONNECTIONS =
    [
        "T0",
        "T1",
        "T2",
        "T3",
        "T4",
        "T5",
        "T6",
        "T7"
    ];

    public static readonly string[] BOTTOM_CONNECTIONS =
    [
        "B0",
        "B1",
        "B2",
        "B3",
        "B4",
        "B5",
        "B6",
        "B7"
    ];

    public static readonly string[] RIGHT_CONNECTIONS =
    [
        "R0",
        "R1",
        "R2",
        "R3",
        "R4",
        "R5",
        "R6",
        "R7"
    ];

    public static readonly string[] LEFT_CONNECTIONS =
    [
        "L0",
        "L1",
        "L2",
        "L3",
        "L4",
        "L5",
        "L6",
        "L7"
    ];

    public static readonly Dictionary<string, string> MATING_CONNECTIONS = new() {
        { "T0", "B0" },
        { "T1", "B1" },
        { "T2", "B2" },
        { "T3", "B3" },
        { "T4", "B4" },
        { "T5", "B5" },
        { "T6", "B6" },
        { "T7", "B7" },
        { "B0", "T0" },
        { "B1", "T1" },
        { "B2", "T2" },
        { "B3", "T3" },
        { "B4", "T4" },
        { "B5", "T5" },
        { "B6", "T6" },
        { "B7", "T7" },
        { "R0", "L0" },
        { "R1", "L1" },
        { "R2", "L2" },
        { "R3", "L3" },
        { "R4", "L4" },
        { "R5", "L5" },
        { "R6", "L6" },
        { "R7", "L7" },
        { "L0", "R0" },
        { "L1", "R1" },
        { "L2", "R2" },
        { "L3", "R3" },
        { "L4", "R4" },
        { "L5", "R5" },
        { "L6", "R6" },
        { "L7", "R7" }
    };
}
