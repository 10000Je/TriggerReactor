IMPORT java.lang.System
IMPORT java.util.Date
import java.text.SimpleDateFormat

date = Date(System.currentTimeMillis())
date_format = SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초")
date_format = date_format.format(date)

FOR i = 0:100
    #MESSAGE ""
ENDFOR
#MESSAGE "&6놀이터 &fㅣ &f개인채팅청소를 완료 하였습니다."
#MESSAGE "&6놀이터 &fㅣ &e현재 시각 &f: &6" + date_format