IMPORT org.bukkit.Material
IMPORT org.bukkit.Sound
IMPORT com.bgsoftware.superiorskyblock.api.SuperiorSkyblockAPI

player = event.getPlayer()

IF event.getBlockPlaced().getType().equals(Material.BEDROCK)
    superiorPlayer = SuperiorSkyblockAPI.getPlayer(player)
    IF !superiorPlayer.isInsideIsland()
        #STOP
    ENDIF
    player.playSound(player.getLocation(), Sound.ENTITY_PLAYER_LEVELUP, 1, 1)
    player.sendMessage("§6놀이터 §fㅣ §e베드락을 제거하실려면 \"/베드락 제거\" 명령어를 이용해주세요.");
    #STOP
ENDIF