IF args.length == 0
    #MESSAGE ""
    #MESSAGE "&6놀이터 &f｜ /금지템 우클릭 - &6우킬릭(사용)을 금지하는 아이템을 보여줍니다."
    #MESSAGE "&6놀이터 &f｜ /금지템 조합 - &6조합을 금지하는 아이템을 보여줍니다."
    #STOP
ENDIF

IF args[0] == "우클릭"
    page = 1
    callType = "RC"
    #CALL "BanItem-RC" false
    #STOP
ENDIF

IF args[0] == "조합"
    page = 1
    callType = "CRAFT"
    #CALL "BanItem-Craft" false
    #STOP
ENDIF

#MESSAGE "&6놀이터 &f｜ &c해당 명령어가 존재하지 않습니다. &f/금지템"