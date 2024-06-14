package designs;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.SortedSet;

public class MapDesign {

    private ArrayList<ArrayList<ArrayList<String>>> connectionMatrix;
    private SortedSet<int[]> seededSections;
    private SortedSet<int[]> safetyBuffer;

    // Main outputs
    private ArrayList<ArrayList<Integer>> displayMatrix;
    private ArrayList<ArrayList<ArrayList<Integer>>> validIdMatrix;
    private HashMap<Integer, String> imageMap = new HashMap<>();

    @Override
    public String toString() {
        return this.toString();// TODO
    }
}
