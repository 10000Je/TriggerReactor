IMPORT org.bukkit.event.inventory.InventoryType

IF event.getInventory().getType().equals(InventoryType.HOPPER)
    #BROADCAST event.getItem().getItemStack().getType().name()
ENDIF