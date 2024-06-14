
public class App {
    public static void main(String[] args) {
        switch (args[1]) {
            case "-design-maps":
                Commands.designMaps(args[2]);
                break;

            case "-load-tiles":
                Commands.loadTiles();
                break;

            case "-delete-all-tiles":
                Commands.deleteAllTiles();
                break;

            case "-help":
                // Fall through
            default:
                Commands.help();
                break;
        }
    }
}
