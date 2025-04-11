IMPORT org.bukkit.event.block.Action

player = event.getPlayer()

IF player.hasPermission("banitem.admin")
    #STOP
ENDIF

IF !event.getAction().name().contains("RIGHT_CLICK")
    #STOP
ENDIF

itemList = {"BANITEM.RC"}

FOR item = itemList.values()
    IF player.getInventory().getItemInMainHand().isSimilar(item)
        event.setCancelled(true)
        player.sendMessage("§6놀이터 §f｜ §c해당 아이템은 사용할 수 없습니다.")
        #STOP
    ENDIF
ENDFOR