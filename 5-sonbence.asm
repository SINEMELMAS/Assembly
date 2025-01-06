data segment 
    numbers db 2, 4, 5, 8
    difference db 4 dup(?)

ends

stack segment
    dw   128  dup(0)
ends

code segment
start:

    mov ax, data
    mov ds, ax
    mov cx, 4
    mov si, 0 
    mov di, offset difference
    
    
    
sub_loop:
mov al,[numbers+si]
mov bx, si
and bl, 0FFh
sub al, bl
mov [di],al
inc si
inc di
loop sub_loop

mov ax, 4c00h
int 21h  

code ends

end start
