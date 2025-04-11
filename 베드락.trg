IMPORT com.bgsoftware.superiorskyblock.api.SuperiorSkyblockAPI
IMPORT org.bukkit.Material
IMPORT org.bukkit.Sound

IF args.length == 0
    #MESSAGE "&6놀이터 &f｜ &f/베드락 제거 - &6섬에 있는 베드락을 제거합니다."
    #STOP
ENDIF

IF args[0] == "제거"
    superiorPlayer = SuperiorSkyblockAPI.getPlayer(player)
    IF !superiorPlayer.isInsideIsland()
        #MESSAGE "&6놀이터 &f｜ &c이 명령어는 당신의 섬 안에서만 사용할 수 있습니다."
        #STOP
    ENDIF
    block = player.getTargetBlock(null, 10)
    IF block.getType() != Material.BEDROCK
        #MESSAGE "&6놀이터 &f｜ &c해당 블록은 베드락이 아닙니다."
        #STOP
    ENDIF
    SYNC
        block.breakNaturally()
    ENDSYNC
    player.playSound(player.getLocation(), Sound.ENTITY_EXPERIENCE_ORB_PICKUP, 1, 1)
    #MESSAGE "&6놀이터 &f｜ 베드락 제거가 완료되었습니다!"
    #STOP
ENDIF

#MESSAGE "&6놀이터 &f｜ 명령어를 잘못 입력했습니다. /베드락"


