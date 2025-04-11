IMPORT org.bukkit.event.block.Action
IMPORT org.bukkit.Material

IF event.getAction() == Action.PHYSICAL && event.getClickedBlock().getType() == Material.SOIL
    event.setCancelled(true)
ENDIF