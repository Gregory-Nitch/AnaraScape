package designs;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.SortedSet;

public class MapDesign {

    private ArrayList<ArrayList<ArrayList<String>>> connectionMatrix;
    private SortedSet<int[]> seededSections;
    private SortedSet<int[]> safetyBuffer;

    // Main outputs
    ArrayList<ArrayList<Integer>> displayMatrix;
    ArrayList<ArrayList<ArrayList<Integer>>> validIdMatrix;
    HashMap<Integer, String> imageMap = new HashMap<>();

    @Override
    public String toString() {
        return this.toString();// TODO
    }
}
