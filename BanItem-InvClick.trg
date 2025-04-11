IMPORT org.bukkit.Bukkit
IMPORT org.bukkit.Sound

// 금지템[우클릭] 설정창 인벤토리 클릭 이벤트 설정

uuid = event.getWhoClicked().getUniqueId()
player = Bukkit.getPlayer(uuid)

IF {?"BANITEM.SETRC.STATE"} == true && {?"BANITEM.SETRC.PLAYER"} == player.getUniqueId()
    IF event.getRawSlot() >= 36 && event.getRawSlot() <= 53
        event.setCancelled(true)
        IF event.getRawSlot() == 45 && {?"BANITEM.SETRC.PAGE"} != 1
            player.playSound(player.getLocation(), Sound.UI_BUTTON_CLICK, 1, 1)
            page = {?"BANITEM.SETRC.PAGE"} - 1
            callType = "SETRC"
            #CALL "BanItem-RC" false
            #STOP
        ENDIF
        
        IF event.getRawSlot() == 53
            player.playSound(player.getLocation(), Sound.UI_BUTTON_CLICK, 1, 1)
            page = {?"BANITEM.SETRC.PAGE"} + 1
            callType = "SETRC"
            #CALL "BanItem-RC" false
            #STOP
        ENDIF
        #STOP
    ENDIF
ENDIF

// 금지템[우클릭] 유저용 인벤토리 클릭 이벤트 설정

IF {?"BANITEM.RC." + player.getUniqueId() + ".STATE"} == true
    event.setCancelled(true)
    IF event.getRawSlot() == 45 && {?"BANITEM.RC." + player.getUniqueId() + ".PAGE"} != 1
        player.playSound(player.getLocation(), Sound.UI_BUTTON_CLICK, 1, 1)
        page = {?"BANITEM.RC." + player.getUniqueId() + ".PAGE"} - 1
        callType = "RC"
        #CALL "BanItem-RC" false
        #STOP
    ENDIF
        
    IF event.getRawSlot() == 53
        player.playSound(player.getLocation(), Sound.UI_BUTTON_CLICK, 1, 1)
        page = {?"BANITEM.RC." + player.getUniqueId() + ".PAGE"} + 1
        callType = "RC"
        #CALL "BanItem-RC" false
        #STOP
    ENDIF
ENDIF

// 금지템[조합] 설정창 인벤토리 클릭 이벤트 설정

IF {?"BANITEM.SETCRAFT.STATE"} == true && {?"BANITEM.SETCRAFT.PLAYER"} == player.getUniqueId()
    IF event.getRawSlot() >= 36 && event.getRawSlot() <= 53
        event.setCancelled(true)
        IF event.getRawSlot() == 45 && {?"BANITEM.SETCRAFT.PAGE"} != 1
            player.playSound(player.getLocation(), Sound.UI_BUTTON_CLICK, 1, 1)
            page = {?"BANITEM.SETCRAFT.PAGE"} - 1
            callType = "SETCRAFT"
            #CALL "BanItem-Craft" false
            #STOP
        ENDIF
        
        IF event.getRawSlot() == 53
            player.playSound(player.getLocation(), Sound.UI_BUTTON_CLICK, 1, 1)
            page = {?"BANITEM.SETCRAFT.PAGE"} + 1
            callType = "SETCRAFT"
            #CALL "BanItem-Craft" false
            #STOP
        ENDIF
        #STOP
    ENDIF
ENDIF

// 금지템[조합] 유저용 인벤토리 클릭 이벤트 설정

IF {?"BANITEM.CRAFT." + player.getUniqueId() + ".STATE"} == true
    event.setCancelled(true)
    IF event.getRawSlot() == 45 && {?"BANITEM.CRAFT." + player.getUniqueId() + ".PAGE"} != 1
        player.playSound(player.getLocation(), Sound.UI_BUTTON_CLICK, 1, 1)
        page = {?"BANITEM.CRAFT." + player.getUniqueId() + ".PAGE"} - 1
        callType = "CRAFT"
        #CALL "BanItem-Craft" false
        #STOP
    ENDIF
        
    IF event.getRawSlot() == 53
        player.playSound(player.getLocation(), Sound.UI_BUTTON_CLICK, 1, 1)
        page = {?"BANITEM.CRAFT." + player.getUniqueId() + ".PAGE"} + 1
        callType = "CRAFT"
        #CALL "BanItem-Craft" false
        #STOP
    ENDIF
    #STOP
ENDIF
