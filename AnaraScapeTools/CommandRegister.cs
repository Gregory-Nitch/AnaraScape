/**
 * Serves as a central location to hold tool commands.
 */

using AnaraScapeTools.Commands;

namespace AnaraScapeTools;

public class CommandRegister
{
    public Dictionary<string, IToolCommand> Commands = new()
    {
        {"help", new Help() },
        {"loadtiles", new LoadTiles() }
    };
}
