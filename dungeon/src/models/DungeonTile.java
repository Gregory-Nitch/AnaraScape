
package models;

import java.util.ArrayList;

/**
 * This class represents a dungeon tile image stored in the database.
 */
public class DungeonTile {

    private String name;
    private String style;
    private ArrayList<String> connections;
    private boolean isEntrance;
    private String isStairs;
    private String filename;

    /**
     * Constructs a new DungeonTile based on parameters which is normally loaded
     * from the database.
     * 
     * @param name        name of the tile
     * @param style       style of the tile such as 'fort'
     * @param connections list of the tile's connections
     * @param isEntrance  denotes an entrance to the dungeon (ground level)
     * @param isStairs    denotes that the tile is stairs (up/down/false)
     * @param filename    acutal filename of the image associated with this tile
     */
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

    /**
     * Gets the name of the tile.
     * 
     * @return name of the tile
     */
    public String getName() {
        return name;
    }

    /**
     * Gets the style of the tile.
     * 
     * @return style of the tile
     */
    public String getStyle() {
        return style;
    }

    /**
     * Gets the list of connections associated with the tile.
     * 
     * @return list of connections
     */
    public ArrayList<String> getConnections() {
        return connections;
    }

    /**
     * Gets whether or not the tile is an entrance tile.
     * 
     * @return bool status (true = is entrance / false = is not entrance)
     */
    public boolean isEntrance() {
        return isEntrance;
    }

    /**
     * Gets whether or not the tile is a stair tile.
     * 
     * @return string representing 3 options (up/down/false)
     */
    public String getIsStairs() {
        return isStairs;
    }

    /**
     * Gets the tiles associated image.
     * 
     * @return filename of the tiles image
     */
    public String getFilename() {
        return filename;
    }

    /**
     * Filters out tiles that do not meet entrance and stair settings of the filter.
     * NOTE: tiles sent to the designer should already be filtered by style.
     * 
     * @param originalList original list of tiles
     * @param isEntrance   entrance filter
     * @param isStairs     stairs filter
     * @return filtered list of tiles that match the passed filters
     */
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
