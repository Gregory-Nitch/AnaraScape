
package designs;

import java.util.List;

import models.DungeonTile;

public class MapDesigner {

    private short height;
    private short width;
    private String level;
    private boolean hasStairs;
    private final List<DungeonTile> TILES;
    private MapDesign design;

    public MapDesigner(
            short height,
            short width,
            String level,
            boolean hasStairs,
            List<DungeonTile> tiles) {

        this.height = height;
        this.width = width;
        this.level = level;
        this.hasStairs = hasStairs;
        this.TILES = tiles;
    }

    public MapDesign generate() {
        design = new MapDesign();

        return design;
    }

}
