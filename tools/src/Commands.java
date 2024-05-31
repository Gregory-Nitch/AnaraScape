
import java.io.File;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;
import java.util.Scanner;

public abstract class Commands {

    private Commands() {
        throw new IllegalStateException("Commands is  a utility class!");
    }

    /**
     * Prints the help menu to the console.
     */
    public static void help() {
        StringBuilder builder = new StringBuilder();
        builder.append("Usage:\n")
                .append("-help: lists all the available commands for this tool\n")
                .append("-load-tiles: loads all tiles from tiles staging folder to database\n")
                .append("-design-maps: produces a map design or designs based on input\n")
                .append("-delete-all-tiles: DELETES ALL tiles from the database\n");
        System.out.println(builder.toString());
    }

    /**
     * Loads all tiles in the 'tilestaging' folder the the database.
     * Tile naming convention =
     * name^style^connections(c,c,c)^entrance(t/f)^stairs(u/d/f)
     * 
     * @param dbProps properties loaded from xml settings
     * @param tileDir directory containing tiles to load (tilestaging)
     */
    public static void loadTiles(final Map<String, String> dbProps, final String tileDir) {
        String url = dbProps.get("dbUrl");
        String user = dbProps.get("dbUser");
        String pass = dbProps.get("dbPassword");

        final File tileFolder = new File(tileDir);
        File[] files = tileFolder.listFiles();
        String storedProcedure = "{call load_tile(?, ?, ?, ?, ?)}";

        try (
                Connection conn = DriverManager.getConnection(url, user, pass);
                CallableStatement cs = conn.prepareCall(storedProcedure);) {
            for (int i = 0; i < files.length; i++) {
                String filename = files[i].getName();
                String[] tileValues = filename.split("\\^");
                cs.setString(1, tileValues[0]);
                cs.setString(2, tileValues[1]);
                cs.setString(3, tileValues[2]);
                cs.setBoolean(4, Boolean.parseBoolean(tileValues[3]));
                cs.setString(5, tileValues[4].replace(".jpg", ""));
                cs.addBatch();
            }
            cs.executeBatch();
            System.out.println("\n---Tiles Loaded!---\n");
        } catch (SQLException e) {
            System.out.println("ERROR: database connection / batch failure!");
            e.printStackTrace();
        }
    }

    public static void designMaps(String args) {
        // TODO
    }

    /**
     * DELETES ALL tiles from the database, requires confirmation message.
     * 
     * @param dbProps properties loaded from xml settings
     */
    public static void deleteAllTiles(Map<String, String> dbProps) {

        Scanner scan = new Scanner(System.in);

        System.out.println("This command will DELETE ALL tiles from the database," +
                " type 'DELETE' to confirm:");
        System.out.print("> ");
        String confirmString = scan.nextLine();

        if (!"DELETE".equals(confirmString)) {
            System.out.println("Improper response aborting delete!");
            return;
        }

        String url = dbProps.get("dbUrl");
        String user = dbProps.get("dbUser");
        String pass = dbProps.get("dbPassword");

        String storedProcedure = "{call delete_all_tiles()}";

        try (Connection conn = DriverManager.getConnection(url, user, pass);
                CallableStatement cs = conn.prepareCall(storedProcedure);) {
            cs.execute();
            System.out.println("All dungeon tiles deleted...");
        } catch (SQLException e) {
            System.out.println("ERROR: database connection / batch failure!");
            e.printStackTrace();
        }
    }
}
