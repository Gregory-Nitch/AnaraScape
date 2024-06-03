package designs;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeSet;

import models.MapCoordinate;

public class MapDesign {

    ArrayList<ArrayList<SortedSet<String>>> connectionMatrix = new ArrayList<>();
    SortedSet<MapCoordinate> seededSections = new TreeSet<>();
    SortedSet<MapCoordinate> safetyBuffer = new TreeSet<>();
    HashMap<String, HashSet<MapCoordinate>> edgeMap = new HashMap<>();
    MapCoordinate entrance;
    MapCoordinate stairsDown;
    MapCoordinate stairsUp;
    int requiredSeeds;

    // Main outputs
    ArrayList<ArrayList<Integer>> displayMatrix = new ArrayList<>();
    ArrayList<ArrayList<HashSet<Integer>>> validIdMatrix = new ArrayList<>();
    HashMap<Integer, String> imageMap = new HashMap<>();

    public List<ArrayList<Integer>> getDisplayMatrix() {
        return displayMatrix;
    }

    public List<ArrayList<HashSet<Integer>>> getValidIdMatrix() {
        return validIdMatrix;
    }

    public Map<Integer, String> getImageMap() {
        return imageMap;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();

        builder.append("----Connection Matrix----\n");
        for (ArrayList<SortedSet<String>> row : connectionMatrix) {
            builder.append("[");
            for (SortedSet<String> col : row) {
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

        if (stairsUp != null) {
            builder.append("\nStairs Up: (row,col)");
            builder.append(stairsUp.toString());
        }

        if (stairsDown != null) {
            builder.append("\nStairs Down: (row,col)");
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
