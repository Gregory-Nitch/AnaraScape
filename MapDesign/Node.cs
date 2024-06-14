

namespace MapDesignLibrary;

/// <summary>
/// Defines a node or a section in the map, use by AStar method to validate maps.
/// </summary>
public class Node
{
    public (int row, int col) State;
    public Node? Parent;
    public int Cost;

    public Node((int row, int col) state, Node? parent, int cost, (int row, int col) target)
    {
        State = state;
        Parent = parent;
        Cost = cost + (Math.Abs(State.row - target.row) + Math.Abs(State.col - target.row));
    }
}
