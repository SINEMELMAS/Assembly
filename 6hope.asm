data segment
    numbers db 2, 5, 4, 6
    count dw 4         ; Dizi elemanlar�
ends

stack segment
    dw 128 dup(0)                 ; Y���n alan�
ends

code segment
start:
    mov ax, data                  ; Veri segmentini y�kle
    mov ds, ax                    ; DS'yi veri segmentine i�aret et
    lea si, numbers 
    mov cx, count     ; BX'e numbers dizisinin adresini y�kle
    
increment_loop:
    mov al,[si]       ; Dizinin o anki eleman�n� 1 art�r
    inc al
    mov [si],al
    inc si
    loop increment_loop
    mov ax, 4c00h
    int 21h                     ; DOS interrupt �a�r�s�

ends

end start
