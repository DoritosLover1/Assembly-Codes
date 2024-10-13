
.stack 100h

data SEGMENT
    dividend dw 12345   
    divisor  dw 123    
    quotient dw 0      
    remainder dw 0     
data ENDS


code SEGMENT

START:
    mov ax, @data
    mov ds, ax
    xor ax, ax

    mov ax, [dividend]
    mov bx, [divisor]
    xor cx, cx             
    xor dx, dx             

divide_loop:
    cmp ax, bx               
    jb done                 

    sub ax, bx              
    inc cx                  
    jmp divide_loop          

done:

    mov [quotient], cx
    mov [remainder], ax

    mov ah, 4Ch
    int 21h
           
code ENDS