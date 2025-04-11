IMPORT org.bukkit.entity.EntityType
IMPORT org.bukkit.Material

IF event.getEntityType() != EntityType.PLAYER && event.getBlock().getType() == Material.SOIL
    event.setCancelled(true)
ENDIF