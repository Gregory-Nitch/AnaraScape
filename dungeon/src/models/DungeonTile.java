
package models;

public class DungeonTile {

    private String name;
    private String style;
    private String[] connections;
    private boolean isEntrance;
    private String isStairs;
    private String filename;

    public DungeonTile(
            String name,
            String style,
            String[] connections,
            boolean isEntrance,
            String isStairs,
            String filename) {

        this.name = name;
        this.style = style;
        this.connections = connections;
        this.isEntrance = isEntrance;
        this.isStairs = isStairs;
        this.filename = filename;
    }

    public String getName() {
        return name;
    }

    public String getStyle() {
        return style;
    }

    public String[] getConnections() {
        return connections;
    }

    public boolean isEntrance() {
        return isEntrance;
    }

    public String getIsStairs() {
        return isStairs;
    }

    public String getFilename() {
        return filename;
    }
}
