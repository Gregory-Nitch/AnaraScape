package designs;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import models.MapCoordinate;

/**
 * This class represents a dungeon map design made to create a map image for
 * users. Main outputs used are the display matrix, valid id matrix, and image
 * map.
 */
public class MapDesign {

    ArrayList<ArrayList<TreeSet<String>>> connectionMatrix = new ArrayList<>();
    TreeSet<MapCoordinate> seededSections = new TreeSet<>();
    TreeSet<MapCoordinate> safetyBuffer = new TreeSet<>();
    HashMap<String, ArrayList<MapCoordinate>> edgeMap = new HashMap<>();
    MapCoordinate entrance;
    MapCoordinate stairsDown;
    int requiredSeeds;

    // Main outputs
    ArrayList<ArrayList<Integer>> displayMatrix = new ArrayList<>();
    ArrayList<ArrayList<HashSet<Integer>>> validIdMatrix = new ArrayList<>();
    HashMap<Integer, String> imageMap = new HashMap<>();

    /**
     * Returns the display matrix of the map design.
     * 
     * @return a 2d ArrayList of the tile ids choosen to be initialy displayed
     */
    public ArrayList<ArrayList<Integer>> getDisplayMatrix() {
        return displayMatrix;
    }

    /**
     * Returns the 3d array/set container which holds the set of ids for each
     * coordinate in the map design.
     * 
     * @return 3d ArrayList of ArrayList of HashSet of ids (Integer)
     */
    public ArrayList<ArrayList<HashSet<Integer>>> getValidIdMatrix() {
        return validIdMatrix;
    }

    /**
     * Returns the map of ids to images for the map, used for display to user and
     * image merging.
     * 
     * @return HashMap of ids(key) and image filenames(value)
     */
    public HashMap<Integer, String> getImageMap() {
        return imageMap;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();

        builder.append("----Connection Matrix----\n");
        for (ArrayList<TreeSet<String>> row : connectionMatrix) {
            builder.append("[");
            for (TreeSet<String> col : row) {
                builder.append("[");
                for (String connection : col) {
                    builder.append(connection);
                    builder.append(" ");
                }
                builder.append("]");
            }
            builder.append("]\n");
        }

        builder.append("\n\n----Descriptions----\n");
        builder.append("Seeded Sections: (row,col)");
        for (MapCoordinate coordinate : seededSections) {
            builder.append(coordinate.toString());
            builder.append(" ");
        }

        builder.append("\nSaftey Buffer: (row,col)");
        for (MapCoordinate coordinate : safetyBuffer) {
            builder.append(coordinate);
            builder.append(" ");
        }

        if (entrance != null) {
            builder.append("\nEntrance: (row,col)");
            builder.append(entrance.toString());
        }

        if (stairsDown != null) {
            builder.append("\nStairs Up: (row,col)");
            builder.append(stairsDown.toString());
        }

        builder.append("\n\n----ID Display Matrix----\n");
        for (ArrayList<Integer> row : displayMatrix) {
            builder.append("[");
            for (Integer colInt : row) {
                builder.append(colInt);
                builder.append(" ");
            }
            builder.append("]\n");
        }

        builder.append("\n\n----Valid ID Matrix----\n");
        for (ArrayList<HashSet<Integer>> row : validIdMatrix) {
            builder.append("[");
            for (HashSet<Integer> col : row) {
                builder.append("[");
                for (Integer id : col) {
                    builder.append(id);
                    builder.append(" ");
                }
                builder.append("]");
            }
            builder.append("]\n");
        }

        return builder.toString();
    }
}
