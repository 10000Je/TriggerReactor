IMPORT org.bukkit.Material
IMPORT org.bukkit.inventory.ItemStack
IMPORT org.bukkit.GameMode

block = event.getBlock()

IF event.getBlock().getType().equals(Material.ENDER_CHEST)
    IF !event.getPlayer().getGameMode().equals(GameMode.SURVIVAL)
        #STOP
    ENDIF
    event.setDropItems(false)
    block.getWorld().dropItemNaturally(block.getLocation(), ItemStack(Material.ENDER_CHEST))
    #STOP
ENDIF