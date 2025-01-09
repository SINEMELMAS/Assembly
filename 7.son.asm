data segment
    numbers db -2,1,0,-1,4
    neg_count db 0
    pos_count db 0
    zero_count db 0
    negatives db 5 dup (?)
    positives db 5 dup (?)
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:

    mov ax, data  
    mov ds, ax
    mov si,0
    mov di,0
    mov bx,0
check_next:
    mov al,numbers[si]
    cmp al, 0
    jl add_to_negative
    je check_zero
    jmp add_to_positive  

add_to_negative:
    mov negatives[di],al
    inc di
    inc neg_count
    jmp increment_index 

add_to_positive:
    mov positives[bx],al
    inc bx
    inc pos_count
    jmp increment_index 

check_zero:
    inc zero_count
    jmp increment_index

increment_index:
    inc si
    cmp si,5
    jl check_next

    mov ax, 4c00h
    int 21h  
ends
end start
