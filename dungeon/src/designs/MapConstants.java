
package designs;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * This abstract class contains constants for maps such as lists of connections
 * and key values for edges.
 */
abstract class MapConstants {

        /**
         * Private constructor, so that a class object cannot be made.
         * 
         * @throws IllegalStateException this class only contains constants and should
         *                               not allow instances to be made
         */
        private MapConstants() {
                throw new IllegalStateException(
                                "The MapConstant class should not have class instances");
        }

        static final int EMPTY_TILE_FREQ = 5;

        static final ArrayList<String> VALID_LEVELS = new ArrayList<>();
        static {
                VALID_LEVELS.add("top");
                VALID_LEVELS.add("middle");
                VALID_LEVELS.add("bottom");
        }

        static final String[] EDGE_KEYS = new String[] { "top", "bottom", "left", "right" };

        static final String[] BOTTOM_CONNECTIONS = new String[] {
                        "B0",
                        "B1",
                        "B2",
                        "B3",
                        "B4",
                        "B5",
                        "B6",
                        "B7",
        };

        static final String[] TOP_CONNECTIONS = new String[] {
                        "T0",
                        "T1",
                        "T2",
                        "T3",
                        "T4",
                        "T5",
                        "T6",
                        "T7",
        };

        static final String[] LEFT_CONNECTIONS = new String[] {
                        "L0",
                        "L1",
                        "L2",
                        "L3",
                        "L4",
                        "L5",
                        "L6",
                        "L7",
        };

        static final String[] RIGHT_CONNECTIONS = new String[] {
                        "R0",
                        "R1",
                        "R2",
                        "R3",
                        "R4",
                        "R5",
                        "R6",
                        "R7",
        };

        static final HashMap<String, String> CONNECTION_MATES = new HashMap<>();
        static {
                CONNECTION_MATES.put("T0", "B0");
                CONNECTION_MATES.put("T1", "B1");
                CONNECTION_MATES.put("T2", "B2");
                CONNECTION_MATES.put("T3", "B3");
                CONNECTION_MATES.put("T4", "B4");
                CONNECTION_MATES.put("T5", "B5");
                CONNECTION_MATES.put("T6", "B6");
                CONNECTION_MATES.put("T7", "B7");

                CONNECTION_MATES.put("B0", "T0");
                CONNECTION_MATES.put("B1", "T1");
                CONNECTION_MATES.put("B2", "T2");
                CONNECTION_MATES.put("B3", "T3");
                CONNECTION_MATES.put("B4", "T4");
                CONNECTION_MATES.put("B5", "T5");
                CONNECTION_MATES.put("B6", "T6");
                CONNECTION_MATES.put("B7", "T7");

                CONNECTION_MATES.put("L0", "R0");
                CONNECTION_MATES.put("L1", "R1");
                CONNECTION_MATES.put("L2", "R2");
                CONNECTION_MATES.put("L3", "R3");
                CONNECTION_MATES.put("L4", "R4");
                CONNECTION_MATES.put("L5", "R5");
                CONNECTION_MATES.put("L6", "R6");
                CONNECTION_MATES.put("L7", "R7");

                CONNECTION_MATES.put("R0", "L0");
                CONNECTION_MATES.put("R1", "L1");
                CONNECTION_MATES.put("R2", "L2");
                CONNECTION_MATES.put("R3", "L3");
                CONNECTION_MATES.put("R4", "L4");
                CONNECTION_MATES.put("R5", "L5");
                CONNECTION_MATES.put("R6", "L6");
                CONNECTION_MATES.put("R7", "L7");
        }
}
