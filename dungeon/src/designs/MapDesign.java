package designs;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedSet;
import models.MapCoordinate;

public class MapDesign {

    private ArrayList<ArrayList<ArrayList<String>>> connectionMatrix;
    private SortedSet<MapCoordinate> seededSections;
    private SortedSet<MapCoordinate> safetyBuffer;

    // Main outputs
    private ArrayList<ArrayList<Integer>> displayMatrix;
    private ArrayList<ArrayList<ArrayList<Integer>>> validIdMatrix;
    private HashMap<Integer, String> imageMap = new HashMap<>();

    public List<ArrayList<Integer>> getDisplayMatrix() {
        return displayMatrix;
    }

    public List<ArrayList<ArrayList<Integer>>> getValidIdMatrix() {
        return validIdMatrix;
    }

    public Map<Integer, String> getImageMap() {
        return imageMap;
    }

    @Override
    public String toString() {
        return this.toString();// TODO
    }
}
