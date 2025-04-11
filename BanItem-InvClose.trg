// 금지템[우클릭] 설정완료.

IF {?"BANITEM.SETRC.STATE"} == true && {?"BANITEM.SETRC.PLAYER"} == event.getPlayer().getUniqueId()
    startIndex = 36 * ({?"BANITEM.SETRC.PAGE"}-1)
    inv = event.getInventory()
    FOR slot = 0:35
        saveIndex = startIndex + slot
        IF inv.getItem(slot) != null
            {"BANITEM.RC.INDEX_" + saveIndex} = inv.getItem(slot)
        ELSE
            {"BANITEM.RC.INDEX_" + saveIndex} = null
        ENDIF
    ENDFOR
    {?"BANITEM.SETRC.STATE"} = null
    {?"BANITEM.SETRC.PLAYER"} = null
    {?"BANITEM.SETRC.PAGE"} = null
    #STOP
ENDIF

// 금지템[우클릭] 보기완료.

IF {?"BANITEM.RC." + event.getPlayer().getUniqueId() + ".STATE"} == true
    {?"BANITEM.RC." + event.getPlayer().getUniqueId() + ".STATE"} = null
    {?"BANITEM.RC." + event.getPlayer().getUniqueId() + ".PAGE"} = null
    #STOP
ENDIF

// 금지템[조합] 설정완료.

IF {?"BANITEM.SETCRAFT.STATE"} == true && {?"BANITEM.SETCRAFT.PLAYER"} == event.getPlayer().getUniqueId()
    startIndex = 36 * ({?"BANITEM.SETCRAFT.PAGE"}-1)
    inv = event.getInventory()
    FOR slot = 0:35
        saveIndex = startIndex + slot
        IF inv.getItem(slot) != null
            {"BANITEM.CRAFT.INDEX_" + saveIndex} = inv.getItem(slot)
        ELSE
            {"BANITEM.CRAFT.INDEX_" + saveIndex} = null
        ENDIF
    ENDFOR
    {?"BANITEM.SETCRAFT.STATE"} = null
    {?"BANITEM.SETCRAFT.PLAYER"} = null
    {?"BANITEM.SETCRAFT.PAGE"} = null
    #STOP
ENDIF

// 금지템[조합] 보기완료.

IF {?"BANITEM.CRAFT." + event.getPlayer().getUniqueId() + ".STATE"} == true
    {?"BANITEM.CRAFT." + event.getPlayer().getUniqueId() + ".STATE"} = null
    {?"BANITEM.CRAFT." + event.getPlayer().getUniqueId() + ".PAGE"} = null
    #STOP
ENDIF