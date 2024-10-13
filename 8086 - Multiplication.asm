.stack 100h

data SEGMENT

multiplier db 5
multiplicand dw 13
product dw ?

data ENDS

code SEGMENT
START:
    MOV AX,data
    MOV DS,AX

    XOR AX,AX

    LEA SI, multiplier
    LEA DI, multiplicand
    LEA BX, product

    MOV CX,4 ; This is for "LOOP" to loop it thats actually repation time

    L1:
        SHR [SI], 1 ;multiplier shift rigth by 1
    
        JNC skip
            MOV DX,[DI]
            ADD [BX],DX

    skip:
        SHL [DI], 1 ;multiplicand shift left by 1
    
    LOOP L1
     
code ENDS
.exit