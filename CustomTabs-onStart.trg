IMPORT java.io.File
IMPORT org.bukkit.configuration.file.YamlConfiguration

IF {?"CUSTOMTABS_CONFIG"} == null
    configFile = File("plugins/TriggerReactor/CommandTrigger/CustomTabs.yml")
    {?"CUSTOMTABS_CONFIG"} = YamlConfiguration.loadConfiguration(configFile)
ENDIF