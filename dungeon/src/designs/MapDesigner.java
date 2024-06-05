
package designs;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Map;
import java.util.Random;
import java.util.TreeSet;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

import exceptions.NoTilesMatchedException;
import models.DungeonTile;
import models.MapCoordinate;

public class MapDesigner {

    private short height;
    private short width;
    private String level;
    private boolean hasStairs;
    private final ArrayList<DungeonTile> TILES;
    private MapDesign design;
    private Random random = new Random();

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

    private void protectCoordinateWithSafteyBuffer(final MapCoordinate coordinate) {
        short row = coordinate.getRow();
        short column = coordinate.getColumn();
        TreeSet<String> connections = design.connectionMatrix.get(row).get(column);

        if (design.edgeMap.get("top").contains(coordinate) &&
                design.edgeMap.get("left").contains(coordinate)) {

            if (connections.first().contains("R")) {
                design.safetyBuffer.add(new MapCoordinate(row, (short) (column + 1)));
            }
            if (connections.first().contains("B")) {
                design.safetyBuffer.add(new MapCoordinate((short) (row + 1), column));
            }

            design.safetyBuffer.add(new MapCoordinate((short) (row + 1), (short) (column + 1)));
            return;

        } else if (design.edgeMap.get("top").contains(coordinate) &&
                design.edgeMap.get("right").contains(coordinate)) {

            if (connections.first().contains("L")) {
                design.safetyBuffer.add(new MapCoordinate(row, (short) (column - 1)));
            }
            if (connections.first().contains("B")) {
                design.safetyBuffer.add(new MapCoordinate((short) (row + 1), column));
            }

            design.safetyBuffer.add(new MapCoordinate((short) (row + 1), (short) (column - 1)));
            return;

        } else if (design.edgeMap.get("bottom").contains(coordinate) &&
                design.edgeMap.get("left").contains(coordinate)) {

        } else if (design.edgeMap.get("bottom").contains(coordinate) &&
                design.edgeMap.get("right").contains(coordinate)) {

        }

    }
}
