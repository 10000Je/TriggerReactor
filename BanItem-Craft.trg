player = event.getWhoClicked()

IF player.hasPermission("banitem.admin")
    #STOP
ENDIF

itemList = {"BANITEM.CRAFT"}

FOR item = itemList.values()
    IF event.getCurrentItem().isSimilar(item)
        event.setCancelled(true)
        player.sendMessage("§6놀이터 §f｜ §c해당 아이템은 조합할 수 없습니다.")
        #STOP
    ENDIF
ENDFOR