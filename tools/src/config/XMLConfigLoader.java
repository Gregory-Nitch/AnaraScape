
package config;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public abstract class XMLConfigLoader {

    private XMLConfigLoader() {
        throw new IllegalStateException("Error: this is a utilility class!");
    }

    /**
     * Gets data from the settings.xml file used store config info.
     * 
     * @return map object with setting names as keys and settings as values
     */
    public static Map<String, String> getConfigProperties(final String configPath) {
        String url = "";
        String user = "";
        String pass = "";

        try {
            Properties props = new Properties();
            props.loadFromXML(new FileInputStream(configPath));
            url = props.getProperty("dbUrl");
            user = props.getProperty("dbUser");
            pass = props.getProperty("dbPassword");

        } catch (IOException e) {
            System.out.println("ERROR: could not read config file!");
            e.printStackTrace();
        }
        Map<String, String> configMap = new HashMap<>();
        configMap.put("dbUrl", url);
        configMap.put("dbUser", user);
        configMap.put("dbPassword", pass);

        return configMap;
    }
}
