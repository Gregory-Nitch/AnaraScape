import java.util.Map;

public class ToolsApp {

    private static final String CONFIG_FILE = "./tools/settings.xml";
    private static final String TILE_FLDR_DIR = "./tools/tilestaging/";

    public static void main(String[] args) {

        Map<String, String> dbProps = XMLConfigLoader.getConfigProperties(CONFIG_FILE);

        switch (args[0]) {
            case "-design-maps":
                Commands.designMaps(args[1]);
                break;

            case "-load-tiles":
                Commands.loadTiles(dbProps, TILE_FLDR_DIR);
                break;

            case "-delete-all-tiles":
                Commands.deleteAllTiles(dbProps);
                break;

            case "-help":
                // Fall through
            default:
                Commands.help();
                break;
        }
    }
}
