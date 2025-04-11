IMPORT java.util.ArrayList
IMPORT java.util.Arrays
IMPORT org.bukkit.Bukkit

permission = "slash.tab"

// 커스텀 자동완성 추가

customCommands = Arrays.asList("/잠수", "/잠수관리")

// 버퍼, 탭리스트 변수 선언

buffer = event.getBuffer()
available = ArrayList()

// 슬래시 탭 방지

IF buffer.startsWith("/")
    args = buffer.split("(?= )")
    IF(args.length == 1)
        IF event.getSender().hasPermission(permission) || !buffer.equals("/")
            available = event.getCompletions()
            FOR cmd = customCommands
                IF cmd.toLowerCase().startsWith(args[0].toLowerCase())
                    available.add(cmd)
                ENDIF
            ENDFOR
        ENDIF
        event.setCompletions(available)
        #STOP
    ENDIF
ENDIF

// "/잠수관리" 명령어 자동완성

IF buffer.startsWith("/잠수관리 ")
    buffer = buffer.replace("/잠수관리 ", "")
    args = buffer.split("(?= )")
    subCommands = Arrays.asList("지급", "차감", "설정", "확인")
    IF args.length == 1
        FOR text = subCommands
            IF text.toLowerCase().startsWith(args[0].toLowerCase())
                available.add(text)
            ENDIF
        ENDFOR
        event.setCompletions(available)
        #STOP
    ENDIF
    IF args.length == 2 && subCommands.contains(args[0])
        args[1] = args[1].replace(" ", "")
        FOR target = Bukkit.getOfflinePlayers()
            IF target.getName().toLowerCase().startsWith(args[1].toLowerCase())
                available.add(target.getName())
            ENDIF
        ENDFOR
        event.setCompletions(available)
        #STOP
    ENDIF
ENDIF
    