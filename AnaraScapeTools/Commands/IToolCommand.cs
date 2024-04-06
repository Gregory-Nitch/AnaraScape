/**
 * Represents a command to be executed by the tool program
 */

namespace AnaraScapeTools.Commands;

public interface IToolCommand
{
    public string Name { get; }
    public void Job();
}
