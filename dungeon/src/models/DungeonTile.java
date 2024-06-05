
package models;

import java.util.ArrayList;

public class DungeonTile {

    private String name;
    private String style;
    private ArrayList<String> connections;
    private boolean isEntrance;
    private String isStairs;
    private String filename;

    public DungeonTile(
            String name,
            String style,
            ArrayList<String> connections,
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

    public ArrayList<String> getConnections() {
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

    public static ArrayList<DungeonTile> filter(ArrayList<DungeonTile> originalList,
            boolean isEntrance,
            String isStairs) {

        ArrayList<DungeonTile> filteredList = new ArrayList<>();

        for (DungeonTile tile : originalList) {
            if (tile.isEntrance == isEntrance && tile.isStairs.equals(isStairs)) {
                filteredList.add(tile);
            }
        }

        return filteredList;
    }

}
