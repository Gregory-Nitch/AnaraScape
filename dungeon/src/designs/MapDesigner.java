
package designs;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.SortedSet;
import java.util.TreeSet;

import models.DungeonTile;
import models.MapCoordinate;

public class MapDesigner {

    private short height;
    private short width;
    private String level;
    private boolean hasStairs;
    private final ArrayList<DungeonTile> TILES;
    private MapDesign design;

    public MapDesigner(
            short height,
            short width,
            String level,
            boolean hasStairs,
            ArrayList<DungeonTile> tiles) {

        this.height = height;
        this.width = width;
        this.level = level;
        this.hasStairs = hasStairs;
        this.TILES = tiles;
    }

    public MapDesign generate() {
        design = new MapDesign();

        initializeDataSets();

        defineEntryPoints();

        return design;
    }

    private void initializeDataSets() {

        HashSet<MapCoordinate> topEdge = new HashSet<>();
        HashSet<MapCoordinate> bottomEdge = new HashSet<>();
        HashSet<MapCoordinate> leftEdge = new HashSet<>();
        HashSet<MapCoordinate> rightEdge = new HashSet<>();

        for (int row = 0; row < height; row++) {
            ArrayList<SortedSet<String>> connectionRowArray = new ArrayList<>();
            ArrayList<Integer> displayRowArray = new ArrayList<>();
            ArrayList<HashSet<Integer>> validIdRowArray = new ArrayList<>();
            leftEdge.add(new MapCoordinate((short) row, (short) 0));
            rightEdge.add(new MapCoordinate((short) row, width));

            for (int col = 0; col < width; col++) {
                connectionRowArray.add(new TreeSet<>());
                displayRowArray.add(0);
                validIdRowArray.add(new HashSet<>());
                topEdge.add(new MapCoordinate((short) 0, (short) col));
                bottomEdge.add(new MapCoordinate(height, (short) col));
            }

            design.connectionMatrix.add(connectionRowArray);
            design.displayMatrix.add(displayRowArray);
            design.validIdMatrix.add(validIdRowArray);
        }

        design.edgeMap.put("top", topEdge);
        design.edgeMap.put("bottom", bottomEdge);
        design.edgeMap.put("left", leftEdge);
        design.edgeMap.put("right", rightEdge);

        if (height + width > 5) {
            design.requiredSeeds = height + width - 5;
        }
    }

    private void defineEntryPoints() {
        throw new UnsupportedOperationException("Unimplemented method 'defineEntryPoints'");
    }

}
