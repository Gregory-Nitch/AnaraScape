
public abstract class Commands {

    private Commands() {
        throw new IllegalStateException("Commands is  a utility class!");
    }

    public static void help() {
        StringBuilder builder = new StringBuilder();
        builder.append("Usage:\n")
                .append("-help: lists all the available commands for this tool\n")
                .append("-load-tiles: loads all tiles from tiles staging folder to database\n")
                .append("-design-maps: produces a map design or designs based on input\n")
                .append("-delete-all-tiles: DELETES ALL tiles from the database\n");
        System.out.println(builder.toString());
    }

    public static void loadTiles() {
        // TODO
    }

    public static void designMaps(String args) {
        // TODO
    }

    public static void deleteAllTiles() {
        // TODO
    }
}
