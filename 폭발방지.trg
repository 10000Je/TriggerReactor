IF args.length == 0
    #MESSAGE "명령어 : /폭팔방지 [실행 / 취소]"
ELSEIF args[0] == "실행"
    {?"explode_proof"} = true
    #MESSAGE "폭발방지가 실행되었습니다."
ELSEIF args[0] == "취소"
    {?"explode_proof"} = false
    #MESSAGE "폭발방지가 취소되었습니다."
ENDIF