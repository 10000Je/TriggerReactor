IMPORT org.bukkit.Material
IMPORT org.bukkit.Bukkit
IMPORT java.util.HashMap
IMPORT java.lang.Math
IMPORT java.lang.Float

event.setCancelled(true)

replaceBlock = Material.FENCE

blocks = HashMap()
blocks.put("STONE", "60")
blocks.put("COAL_ORE", "10")
blocks.put("IRON_ORE", "8")
blocks.put("GOLD_ORE", "5")
blocks.put("REDSTONE_ORE", "7")
blocks.put("LAPIS_ORE", "7")
blocks.put("EMERALD_ORE", "2.5")
blocks.put("DIAMOND_ORE", "0.5")

high = 0
low = 0
random = Math.random()

IF event.getToBlock().getType() == Material.AIR && event.getToBlock().getRelative(event.getFace()).getType() == replaceBlock
    FOR entry = blocks.entrySet()
        percent = Float.parseFloat(entry.getValue()) / 100
        high = high + percent
        IF random >= low && random < high
            event.getToBlock().setType(entry.getKey())
            #STOP
        ENDIF
        low = low + percent
    ENDFOR
ELSE
    event.setCancelled(false)
ENDIF
