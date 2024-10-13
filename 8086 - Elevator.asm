data SEGMENT
    current_floor db 0
    target_floor db ?
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data

START:

    call get_target_floor
    
    MOV AL, [current_floor]
    MOV BL, [target_floor]
    

    move_elevator:
        CMP AL,BL
        JE reached_target

        JL move_up
        JG move_down

    move_up:
        inc AL
        call display_floor
        jmp move_elevator

    move_down:
        dec AL
        call display_floor
        jmp move_elevator

    reached_target:
        MOV [current_floor], AL
        CALL display_floor

        MOV AX, 4CH
        int 21H

    get_target_floor:
        MOV AH, 1
        INT 21H
        SUB AL,'0'
        MOV [target_floor], AL
        ret
    
    display_floor:
        MOV AH, 09H
        INT 21H
        ret 

code ENDS