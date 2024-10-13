data SEGMENT
ctrl db 4
ans db ?
data ENDS

code SEGMENT
ASSUME CS:code, DS:data

START:
    MOV AL, 5
    MOV CL, ctrl    

check_start:
    SHR AL, 1
    JC SHORT increment_count
    JNC check_next

increment_count:
    INC BL

check_next:
    DEC CL
    JNZ check_start

    MOV [ans], BL

terminate_program:
    INT 21H
code ENDS     
