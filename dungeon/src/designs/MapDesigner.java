
package designs;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Random;
import java.util.TreeSet;
import exceptions.NoTilesMatchedException;
import models.DungeonTile;
import models.MapCoordinate;

/**
 * Class used to generate MapDesign class instances.
 */
public class MapDesigner {

    private short height;
    private short width;
    private String level;
    private boolean hasStairs;
    private final ArrayList<DungeonTile> TILES;
    private MapDesign design;
    private Random random = new Random();

    /**
     * Constructs a designer with the given parameters as design requirements,
     * multiple designs can be genereted from one instance. However, if there are
     * new design requirements than a new class instance will need to be constructed
     * and passed those requirements. NOTE: the DungeonTile ArrayList should already
     * be filtered by dungeon style.
     * 
     * @param height    requested height of output designs
     * @param width     requested width of output designs
     * @param level     requested level of output designs
     * @param hasStairs stairs going down to next level requested in design
     *                  (true/false)
     * @param tiles     list of dungeon tiles filtered by style to be used when
     *                  building the design
     */
    public MapDesigner(
            short height,
            short width,
            String level,
            boolean hasStairs,
            ArrayList<DungeonTile> tiles) {

        if (height > 20 || height < 2 || width > 20 || width < 2) {
            throw new IllegalArgumentException(
                    "Map heights and widths must be between 2 or 20 inclusive");
        }
        if (!MapConstants.VALID_LEVELS.contains(level)) {
            throw new IllegalArgumentException(
                    "Valid map level values are 'top', 'middle', 'bottom' but '" + level +
                            "' was given");
        }
        if (tiles == null) {
            throw new NullPointerException("Tile list passed to the designer is null.");
        }

        this.height = height;
        this.width = width;
        this.level = level;
        this.hasStairs = hasStairs;
        this.TILES = tiles;
    }

    /**
     * Produces a MapDesign based on the set requirements of the designer. To obtain
     * design information use the get methods for the intance's displayMatrix,
     * validIdMatrix and imageMap.
     * 
     * @return a MapDesign randomly generated and validated
     */
    public MapDesign generate() {

        design = new MapDesign();

        initializeDataSets();

        try {
            defineEntryPoints();
        } catch (NoTilesMatchedException e) {
            e.printStackTrace();
            design.toString();
            return design;
        }

        return design;
    }

    /**
     * Prepares all the containers used to construct the map design, some are empty
     * others have special invalid values inserted ("N"/0)
     */
    private void initializeDataSets() {

        ArrayList<MapCoordinate> topEdge = new ArrayList<>();
        ArrayList<MapCoordinate> bottomEdge = new ArrayList<>();
        ArrayList<MapCoordinate> leftEdge = new ArrayList<>();
        ArrayList<MapCoordinate> rightEdge = new ArrayList<>();

        for (int row = 0; row < height; row++) {
            ArrayList<TreeSet<String>> connectionRowArray = new ArrayList<>();
            ArrayList<Integer> displayRowArray = new ArrayList<>();
            ArrayList<HashSet<Integer>> validIdRowArray = new ArrayList<>();
            leftEdge.add(new MapCoordinate((short) row, (short) 0));
            rightEdge.add(new MapCoordinate((short) row, width));

            for (int col = 0; col < width; col++) {
                connectionRowArray.add(new TreeSet<>());
                connectionRowArray.get(col).add("N");
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

    /**
     * Defines the entrypoints of the dungeon based on level and if stairs have been
     * requested.
     * 
     * @throws NoTilesMatchedException no tile can be found that matches the
     *                                 connection and state requirements, the design
     *                                 cannot progress
     */
    private void defineEntryPoints() throws NoTilesMatchedException {

        String isStairs = "";

        if (level.equals("top")) {
            String edgeKey = MapConstants.EDGE_KEYS[random.nextInt(MapConstants.EDGE_KEYS.length)];
            ArrayList<MapCoordinate> edgeArray = design.edgeMap.get(edgeKey);
            design.entrance = edgeArray.get(random.nextInt(edgeArray.size()));
            isStairs = "false";
        }

        else if (level.equals("middle") || level.equals("bottom")) {
            int row = random.nextInt(height);
            int column = random.nextInt(width);
            design.entrance = new MapCoordinate((short) row, (short) column);
            isStairs = "up";
        }

        buildConnectionsForCoordinate(design.entrance, true, isStairs);

        if (hasStairs) {
            protectCoordinateWithSafteyBuffer(design.entrance);
            isStairs = "down";

            int row = random.nextInt(height);
            int column = random.nextInt(width);
            design.stairsDown = new MapCoordinate((short) row, (short) column);

            while (design.stairsDown.equals(design.entrance) ||
                    design.safetyBuffer.contains(design.stairsDown)) {
                design.stairsDown.setColumn((short) random.nextInt(width));
                design.stairsDown.setRow((short) random.nextInt(height));
            }

            buildConnectionsForCoordinate(design.stairsDown, false, isStairs);
            protectCoordinateWithSafteyBuffer(design.stairsDown);
        }
    }

    /**
     * Builds the connections for the passed coordinate based on coordinate state
     * and neighbooring connections.
     * 
     * @param coordinate coordinate to build connections for
     * @param isEntrance if coordinate should be an entrance tile
     * @param isStairs   if coordinate should be a stair tile
     * @throws NoTilesMatchedException no tile can be found that matches the
     *                                 connection and state requirements, the design
     *                                 cannot continue
     */
    private void buildConnectionsForCoordinate(final MapCoordinate coordinate,
            boolean isEntrance,
            String isStairs)
            throws NoTilesMatchedException {

        TreeSet<String> validConnectionSet = new TreeSet<>();
        TreeSet<String> requiredConnectionSet = new TreeSet<>();

        if (coordinate.equals(design.entrance) && level.equals("top")) {

            if (design.edgeMap.get("top").contains(coordinate)) {
                validConnectionSet.addAll(Arrays.asList(MapConstants.BOTTOM_CONNECTIONS));
            }

            if (design.edgeMap.get("bottom").contains(coordinate)) {
                validConnectionSet.addAll(Arrays.asList(MapConstants.TOP_CONNECTIONS));
            }

            if (design.edgeMap.get("left").contains(coordinate)) {
                validConnectionSet.addAll(Arrays.asList(MapConstants.RIGHT_CONNECTIONS));
            }

            if (design.edgeMap.get("right").contains(coordinate)) {
                validConnectionSet.addAll(Arrays.asList(MapConstants.LEFT_CONNECTIONS));
            }
        }

        else if (coordinate.equals(design.entrance)) {
            validConnectionSet.addAll(Arrays.asList(MapConstants.TOP_CONNECTIONS));
            validConnectionSet.addAll(Arrays.asList(MapConstants.BOTTOM_CONNECTIONS));
            validConnectionSet.addAll(Arrays.asList(MapConstants.LEFT_CONNECTIONS));
            validConnectionSet.addAll(Arrays.asList(MapConstants.RIGHT_CONNECTIONS));
        }

        else {
            filterConnectionsByNeighboors(coordinate, validConnectionSet, requiredConnectionSet);
        }

        queryTileSetForFinalConnections(coordinate,
                validConnectionSet,
                requiredConnectionSet,
                isEntrance,
                isStairs);

        design.connectionMatrix.get(coordinate.getRow()).get(coordinate.getColumn())
                .addAll(validConnectionSet);
    }

    /**
     * Sets valid and required connections based on neighbooring coordinate states.
     * 
     * @param coordinate            coordinate to filter connections for
     * @param validConnectionSet    permitted connections for the coordinate
     * @param requiredConnectionSet required connections for the coordinate
     */
    private void filterConnectionsByNeighboors(final MapCoordinate coordinate,
            TreeSet<String> validConnectionSet,
            TreeSet<String> requiredConnectionSet) {

        MapCoordinate neighboorUp = new MapCoordinate((short) (coordinate.getRow() - 1),
                coordinate.getColumn());
        MapCoordinate neighboorDown = new MapCoordinate((short) (coordinate.getRow() + 1),
                coordinate.getColumn());
        MapCoordinate neighboorLeft = new MapCoordinate(coordinate.getRow(),
                (short) (coordinate.getColumn() - 1));
        MapCoordinate neighboorRight = new MapCoordinate(coordinate.getRow(),
                (short) (coordinate.getColumn() + 1));
        MapCoordinate neighboorDownRight = new MapCoordinate((short) (coordinate.getRow() + 1),
                (short) (coordinate.getColumn() + 1));

        MapCoordinate[] neighboors = new MapCoordinate[] {
                neighboorUp,
                neighboorDown,
                neighboorLeft,
                neighboorRight,
                neighboorDownRight
        };

        for (MapCoordinate neighboor : neighboors) {
            short nRow = neighboor.getRow();
            short nColumn = neighboor.getColumn();
            if (nRow < 0 || nRow > height - 1 || nColumn < 0 || nColumn > width - 1) {
                continue;
            }

            TreeSet<String> nConnectionSet = design.connectionMatrix.get(nRow).get(nColumn);

            if (nConnectionSet.contains("N")) {
                if (neighboor.equals(neighboorUp)) {
                    validConnectionSet.addAll(Arrays.asList(MapConstants.TOP_CONNECTIONS));
                } else if (neighboor.equals(neighboorDown)) {
                    validConnectionSet.addAll(Arrays.asList(MapConstants.BOTTOM_CONNECTIONS));
                } else if (neighboor.equals(neighboorLeft)) {
                    validConnectionSet.addAll(Arrays.asList(MapConstants.LEFT_CONNECTIONS));
                } else if (neighboor.equals(neighboorRight)) {
                    validConnectionSet.addAll(Arrays.asList(MapConstants.RIGHT_CONNECTIONS));
                }

            } else if (nConnectionSet.contains("E")) {
                if (neighboor.equals(neighboorDownRight)) {
                    validConnectionSet.removeIf(s -> s.equals("B7") || s.equals("R7"));
                }
                continue;

            } else if (neighboor.equals(neighboorDownRight)) {
                if (nConnectionSet.contains("T0") && nConnectionSet.contains("L0")) {
                    requiredConnectionSet.add("B7");
                    requiredConnectionSet.add("R7");
                } else {
                    validConnectionSet.removeIf(s -> s.equals("B7") || s.equals("R7"));
                }

            } else {
                for (String nConnection : nConnectionSet) {
                    if (neighboor.equals(neighboorUp) && nConnection.contains("B")) {
                        requiredConnectionSet.add(MapConstants.CONNECTION_MATES.get(nConnection));
                    } else if (neighboor.equals(neighboorDown) && nConnection.contains("T")) {
                        requiredConnectionSet.add(MapConstants.CONNECTION_MATES.get(nConnection));
                    } else if (neighboor.equals(neighboorLeft) && nConnection.contains("R")) {
                        requiredConnectionSet.add(MapConstants.CONNECTION_MATES.get(nConnection));
                    } else if (neighboor.equals(neighboorRight) && nConnection.contains("L")) {
                        requiredConnectionSet.add(MapConstants.CONNECTION_MATES.get(nConnection));
                    }
                }
            }
        }
    }

    /**
     * Sets the final connection state of a coordinate based on valid connections,
     * required connections and available DungeonTiles. The resulting final
     * connection set is stored in validConnectionSet.
     * 
     * @param coordinate            coordinate to get connections for
     * @param validConnectionSet    permitted connections for coordinate
     * @param requiredConnectionSet required connections for coordinate
     * @param isEntrance            required entrance state of the coordinate
     * @param isStairs              required stair state of the coordinate
     * @throws NoTilesMatchedException no tiles have been found to match the passed
     *                                 requirements, the design cannot continue
     */
    private void queryTileSetForFinalConnections(final MapCoordinate coordinate,
            TreeSet<String> validConnectionSet,
            TreeSet<String> requiredConnectionSet,
            boolean isEntrance,
            String isStairs)
            throws NoTilesMatchedException {

        ArrayList<DungeonTile> tiles = DungeonTile.filter(TILES, isEntrance, isStairs);
        ArrayList<DungeonTile> matchedTiles = new ArrayList<>();

        for (DungeonTile tile : tiles) {
            ArrayList<String> tileConnections = tile.getConnections();
            if (!requiredConnectionSet.isEmpty() &&
                    !tileConnections.containsAll(requiredConnectionSet)) {
                continue;

            } else if (requiredConnectionSet.isEmpty() &&
                    !isEntrance &&
                    isStairs.equals("false") &&
                    tileConnections.contains("E")) {

                for (int i = 0; i < MapConstants.EMPTY_TILE_FREQ; i++) {
                    matchedTiles.add(tile);
                }
            }

            validConnectionSet.addAll(requiredConnectionSet);
            if (validConnectionSet.containsAll(tileConnections)) {
                matchedTiles.add(tile);
            }
        }

        if (matchedTiles.isEmpty()) {
            throw new NoTilesMatchedException("No tiles were matched with the valid connections " +
                    "set to " + validConnectionSet.toString() + " and required connections set to " +
                    requiredConnectionSet.toString());

        } else {
            DungeonTile randomTile = matchedTiles.get(random.nextInt(height));
            validConnectionSet.clear();
            validConnectionSet.addAll(randomTile.getConnections());
        }
    }

    /**
     * Surrounds the passed coordinate with a saftey buffer preventing any seeded or
     * stairs down tiles from being placed at those coordinates. This prevents
     * design failures where there are unreachable tiles.
     * 
     * @param coordinate coordinate to surround with a buffer
     */
    private void protectCoordinateWithSafteyBuffer(final MapCoordinate coordinate) {

        short row = coordinate.getRow();
        short column = coordinate.getColumn();
        MapCoordinate[] coordinates = new MapCoordinate[] {
                coordinate,
                new MapCoordinate((short) (row - 1), column),
                new MapCoordinate((short) (row - 1), (short) (column + 1)),
                new MapCoordinate(row, (short) (column + 1)),
                new MapCoordinate((short) (row + 1), (short) (column + 1)),
                new MapCoordinate((short) (row + 1), column),
                new MapCoordinate((short) (row + 1), (short) (column - 1)),
                new MapCoordinate(row, (short) (column - 1)),
                new MapCoordinate((short) (row - 1), (short) (column - 1)),
        };

        for (MapCoordinate c : coordinates) {
            if (c.getRow() >= 0 &&
                    c.getRow() < height &&
                    c.getColumn() >= 0 &&
                    c.getColumn() < width) {
                design.safetyBuffer.add(c);
            }
        }
    }
}
