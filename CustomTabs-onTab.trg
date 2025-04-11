IMPORT java.util.ArrayList
IMPORT java.util.HashMap
IMPORT org.bukkit.Bukkit

cf = {?"CUSTOMTABS_CONFIG"}

permission = "slash.tab"
noPerm = "noPerm"

buffer = event.getBuffer()
available = ArrayList()

IF buffer.startsWith("/")
    IF event.getSender().hasPermission(permission)
        IF event.getCompletions().isEmpty()
            available = ArrayList()
        ELSE
            available = event.getCompletions()
        ENDIF
    ENDIF
    args = buffer.split("(?= )")
    FOR key = cf.getKeys(false)
        isTRG = cf.getBoolean(key + ".isTRGCmd", false)
        perm = cf.getString(key + ".permission", noPerm)
        cmd = "/" + key
        IF args.length == 1
            IF cmd.toLowerCase().startsWith(args[0].toLowerCase()) && (event.getSender().hasPermission(perm) || perm.equals(noPerm)) && (isTRG || (!isTRG && !event.getSender().hasPermission(permission)))
                available.add(cmd)
            ENDIF
            IF !(event.getSender().hasPermission(perm) || perm.equals(noPerm)) && (isTRG ||  (!isTRG && !event.getSender().hasPermission(permission)))
                #CONTINUE
            ENDIF
            FOR label = cf.getStringList(key + ".aliases")
                alias = "/" + label
                IF alias.toLowerCase().startsWith(args[0].toLowerCase())
                    available.add(alias)
                ENDIF
            ENDFOR
        ENDIF
        IF args.length > 1
            isAlias = false
            FOR label = cf.getStringList(key + ".aliases")
                alias = "/" + label
                IF args[0].toLowerCase().equals(alias.toLowerCase())
                    isAlias = true
                    #BREAK
                ENDIF
            ENDFOR
            IF (!args[0].toLowerCase().equals(cmd.toLowerCase()) && !isAlias) || (!event.getSender().hasPermission(perm) && !perm.equals(noPerm)) || (!isTRG && event.getSender().hasPermission(permission))
                #CONTINUE
	        ENDIF
            deepKey = key + ".args[" + (args.length - 2) + "]"
            FOR tab = cf.getStringList(deepKey)
                arg = args[args.length - 1].replace(" ", "")
                IF tab.equals("[ONLINEPLAYERS]")
                    FOR player = Bukkit.getOnlinePlayers()
                        available.add(player.getName())
                    ENDFOR
                    #CONTINUE
                ENDIF
                IF tab.equals("[OFFLINEPLAYERS]")
                    FOR offlinePlayer = Bukkit.getOfflinePlayers()
                        available.add(offlinePlayer.getName())
                    ENDFOR
                    #CONTINUE
                ENDIF
                IF tab.toLowerCase().startsWith(arg.toLowerCase())
                    available.add(tab)
                ENDIF
            ENDFOR
            event.setCompletions(available)
            #STOP
        ENDIF
    ENDFOR
    event.setCompletions(available)
ENDIF

    