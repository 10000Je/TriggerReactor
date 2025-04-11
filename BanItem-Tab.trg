IMPORT java.util.ArrayList
IMPORT java.util.Arrays

commandPerm = "banitem.admin"

buffer = event.getBuffer()
available = ArrayList()

IF buffer.startsWith("/금지템관리 ")
    buffer = buffer.replace("/금지템관리 ", "")
    args = buffer.split("(?= )")
    subCommands = Arrays.asList("우클릭", "조합")
    IF args.length == 1
        FOR text = subCommands
            IF text.toLowerCase().startsWith(args[0].toLowerCase()) && event.getSender().hasPermission(commandPerm)
                available.add(text)
            ENDIF
        ENDFOR
        event.setCompletions(available)
        #STOP
    ENDIF
    #STOP
ENDIF

IF buffer.startsWith("/금지템 ")
    buffer = buffer.replace("/금지템 ", "")
    args = buffer.split("(?= )")
    subCommands = Arrays.asList("우클릭", "조합")
    IF args.length == 1
        FOR text = subCommands
            IF text.toLowerCase().startsWith(args[0].toLowerCase())
                available.add(text)
            ENDIF
        ENDFOR
        event.setCompletions(available)
        #STOP
    ENDIF
    #STOP
ENDIF