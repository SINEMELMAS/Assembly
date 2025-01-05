data segment     
numbers db 2, 4, 3, 5           ; numbers dizisi (4 eleman)
square dw 4 dup(0)              ; square dizisi (her eleman word)
ends

stack segment
    dw 128 dup(0)               ; Y���n alan�
ends

code segment
start:

    mov ax, data                 ; Veri segmentinin ba�lang�� adresini y�kle
    mov ds, ax                   ; DS register'�na veri segmentini ata
    
    mov cx, 4                    ; D�ng� sayac� (4 elemanl� dizi)
    mov si, 0                    ; SI register'�n� 0 yap (numbers dizisi ba�lang�c�)
    mov bp, 0                    ; BP register'�n� 0 yap (square dizisi ba�lang�c�)
    
    mov bx, offset numbers       ; BX register'�na numbers dizisinin adresini y�kle
    lea di, square               ; DI register'�na square dizisinin adresini y�kle
                            
takeSquare:
    mov al, [bx + si]            ; numbers dizisinin o anki eleman�n� al
    mov ah, 0                    ; AH'yi s�f�rla (�arpma i�lemi i�in)
    mul al                       ; AL * AL -> AX (karesini al)
    mov [di + bp], ax            ; Sonucu square dizisine yaz (word olarak)
    
    inc si                       ; SI'yi art�r (bir sonraki elemana ge�)
    add bp, 2                    ; BP'yi 2 art�r (word yaz�ld��� i�in)
    loop takeSquare              ; CX s�f�rlanana kadar d�ng�ye devam et
    
    ; Program sonland�rma
    mov ax, 4C00h                ; Program sonland�rma kodu
    int 21h                      ; DOS interrupt �a�r�s�

ends

end start
