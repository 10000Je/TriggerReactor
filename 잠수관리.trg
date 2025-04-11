IMPORT org.bukkit.Bukkit
IMPORT java.lang.Integer

IF args.length == 0
    #MESSAGE ""
    #MESSAGE "&6놀이터 &fㅣ &c/잠수관리 지급 [플레이어] [포인트] &f- 플레이어에게 잠수포인트를 지급합니다."
    #MESSAGE "&6놀이터 &fㅣ &c/잠수관리 차감 [플레이어] [포인트] &f- 플레이어의 잠수포인트를 차감합니다."
    #MESSAGE "&6놀이터 &fㅣ &c/잠수관리 설정 [플레이어] [포인트] &f- 플레이어의 잠수포인트를 설정합니다."
    #MESSAGE "&6놀이터 &fㅣ &c/잠수관리 확인 [플레이어] &f- 플레이어의 잠수포인트를 확인합니다."
    #STOP
ENDIF

IF args[0] == "지급" || args[0] == "차감" || args[0] == "설정" && args.length == 3
    target = Bukkit.getOfflinePlayer(args[1])
    IF !target.hasPlayedBefore()
        #MESSAGE "&6놀이터 &fㅣ &c해당 플레이어는 존재하지 않습니다. &f/잠수관리"
        #STOP
    ENDIF

    IF !$isnumber:args[2]
        #MESSAGE "&6놀이터 &fㅣ &c[포인트] 에는 문자를 입력할 수 없습니다. &f/잠수관리"
        #STOP
    ENDIF

    point = parseInt(args[2])
    IF point < 0
        #MESSAGE "&6놀이터 &fㅣ &c[포인트] 에는 0보다 큰 정수를 입력해야 합니다. &f/잠수관리"
        #STOP
    ENDIF

    IF args[0] == "지급"
        IF {"AFK." + target.getUniqueId() + ".POINT"} == null
            {"AFK." + target.getUniqueId() + ".POINT"} = 0
        ENDIF
        {"AFK." + target.getUniqueId() + ".POINT"} = {"AFK." + target.getUniqueId() + ".POINT"} + point
        #MESSAGE "&6놀이터 &fㅣ 유저 &6" + target.getDisplayName() + " &f님에게 &9" + point + " &f잠수포인트를 지급했습니다."
        IF target.isOnline()
            onlineTarget = target.getPlayer()
            addText = "&6놀이터 &fㅣ 관리자가 당신에게 &9" + point + " &f잠수포인트를 지급했습니다."
            onlineTarget.sendMessage(addText.replace("&", "§"))
        ENDIF
        #STOP
    ENDIF

    IF args[0] == "차감"
        IF {"AFK." + target.getUniqueId() + ".POINT"} == null
            {"AFK." + target.getUniqueId() + ".POINT"} = 0
        ENDIF
        IF point > {"AFK." + target.getUniqueId() + ".POINT"}
            point = {"AFK." + target.getUniqueId() + ".POINT"}
        ENDIF
        {"AFK." + target.getUniqueId() + ".POINT"} = {"AFK." + target.getUniqueId() + ".POINT"} - point
        #MESSAGE "&6놀이터 &fㅣ 유저 &6" + target.getDisplayName() + " &f님의 잠수포인트를 &9" + point + " &f만큼 차감했습니다."
        IF target.isOnline()
            onlineTarget = target.getPlayer()
            removeText = "&6놀이터 &fㅣ 관리자가 당신의 잠수포인트를 &9" + point + " &f만큼 차감했습니다."
            onlineTarget.sendMessage(removeText.replace("&", "§"))
        ENDIF
        #STOP
    ENDIF

    IF args[0] == "설정"
        {"AFK." + target.getUniqueId() + ".POINT"} = point
        #MESSAGE "&6놀이터 &fㅣ 유저 &6" + target.getDisplayName() + " &f님의 잠수포인트를 &9" + point + " &f으로 설정했습니다."
        IF target.isOnline()
            onlineTarget = target.getPlayer()
            setText = "&6놀이터 &fㅣ 관리자가 당신의 잠수포인트를 &9" + point + " &f으로 설정했습니다."
            onlineTarget.sendMessage(setText.replace("&", "§"))
        ENDIF
        #STOP
    ENDIF

    #MESSAGE "&6놀이터 &fㅣ &c명령어가 올바르지 않습니다. &f/잠수관리"
    #STOP
ENDIF

IF args[0] == "확인" && args.length == 2
    target = Bukkit.getOfflinePlayer(args[1])
    IF !target.hasPlayedBefore()
        #MESSAGE "&6놀이터 &fㅣ &c해당 플레이어는 존재하지 않습니다. &f/잠수관리"
        #STOP
    ENDIF
    #MESSAGE "&6놀이터 &fㅣ 유저 &6" + target.getDisplayName() + " &f님의 잠수포인트 : &9" + {"AFK." + target.getUniqueId() + ".POINT"}
    #STOP
ENDIF

#MESSAGE "&6놀이터 &fㅣ &c명령어가 올바르지 않습니다. &f/잠수관리"
#STOP
