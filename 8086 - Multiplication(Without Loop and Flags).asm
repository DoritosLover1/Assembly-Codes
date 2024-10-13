data SEGMENT
num DW 1234h, 1234h
prod DW 2 DUP<0>
data ENDS

code SEGMENT
ASSUME CS:code, DS:data

START:
MOV AX, data
MOV DS, AX
LEA SI, num
MOV AX, [SI]
MOV BX, [SI+2]
MUL BX
;Use IMUL for signed multiplication
MOV prod, AX    ;32 bits product stored in DX-AX registers
MOV prod+2, DX
MOV AH, 4CH
INT 21H ;Terminate the program
code ENDS
END START

