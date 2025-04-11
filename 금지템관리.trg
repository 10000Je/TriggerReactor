IMPORT org.bukkit.Bukkit

IF args.length == 0
    #MESSAGE ""
    #MESSAGE "&6놀이터 &f｜ &c/금지템관리 우클릭 &f- 우클릭을 금지하는 아이템을 설정합니다."
    #MESSAGE "&6놀이터 &f｜ &c/금지템관리 조합 &f- 조합을 금지하는 아이템을 설정합니다."
    #STOP
ENDIF

IF args[0] == "우클릭"
    IF {?"BANITEM.SETRC.STATE"} == true && {?"BANITEM.SETRC.PLAYER"} != null
        #MESSAGE "&6놀이터 &f｜ &c현재 다른 플레이어&f(" + Bukkit.getPlayer({?"BANITEM.SETRC.PLAYER"}).getName() + ")&c가 설정 중입니다."
        #STOP
    #ENDIF
    // player 변수는 이미 존재함.
    page = 1
    callType = "SETRC"
    #CALL "BanItem-RC" false
    #STOP
ENDIF

IF args[0] == "조합"
    IF {?"BANITEM.SETCRAFT.STATE"} == true && {?"BANITEM.SETCRAFT.PLAYER"} != null
        #MESSAGE "&6놀이터 &f｜ &c현재 다른 플레이어&f(" + Bukkit.getPlayer({?"BANITEM.SETCRAFT.PLAYER"}).getName() + ")&c가 설정 중입니다."
        #STOP
    #ENDIF
    // player 변수는 이미 존재함.
    page = 1
    callType = "SETCRAFT"
    #CALL "BanItem-Craft" false
    #STOP
ENDIF

#MESSAGE "&6놀이터 &f｜ &c해당 명령어가 존재하지 않습니다. &f/금지템관리"
