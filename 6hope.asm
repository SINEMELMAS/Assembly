data segment
    numbers db 2, 5, 4, 6
    count dw 4         ; Dizi elemanlarý
ends

stack segment
    dw 128 dup(0)                 ; Yýðýn alaný
ends

code segment
start:
    mov ax, data                  ; Veri segmentini yükle
    mov ds, ax                    ; DS'yi veri segmentine iþaret et
    lea si, numbers 
    mov cx, count     ; BX'e numbers dizisinin adresini yükle
    
increment_loop:
    mov al,[si]       ; Dizinin o anki elemanýný 1 artýr
    inc al
    mov [si],al
    inc si
    loop increment_loop
    mov ax, 4c00h
    int 21h                     ; DOS interrupt çaðrýsý

ends

end start
