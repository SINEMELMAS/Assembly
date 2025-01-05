data segment     
numbers db 2, 4, 3, 5           ; numbers dizisi (4 eleman)
square dw 4 dup(0)              ; square dizisi (her eleman word)
ends

stack segment
    dw 128 dup(0)               ; Yýðýn alaný
ends

code segment
start:

    mov ax, data                 ; Veri segmentinin baþlangýç adresini yükle
    mov ds, ax                   ; DS register'ýna veri segmentini ata
    
    mov cx, 4                    ; Döngü sayacý (4 elemanlý dizi)
    mov si, 0                    ; SI register'ýný 0 yap (numbers dizisi baþlangýcý)
    mov bp, 0                    ; BP register'ýný 0 yap (square dizisi baþlangýcý)
    
    mov bx, offset numbers       ; BX register'ýna numbers dizisinin adresini yükle
    lea di, square               ; DI register'ýna square dizisinin adresini yükle
                            
takeSquare:
    mov al, [bx + si]            ; numbers dizisinin o anki elemanýný al
    mov ah, 0                    ; AH'yi sýfýrla (çarpma iþlemi için)
    mul al                       ; AL * AL -> AX (karesini al)
    mov [di + bp], ax            ; Sonucu square dizisine yaz (word olarak)
    
    inc si                       ; SI'yi artýr (bir sonraki elemana geç)
    add bp, 2                    ; BP'yi 2 artýr (word yazýldýðý için)
    loop takeSquare              ; CX sýfýrlanana kadar döngüye devam et
    
    ; Program sonlandýrma
    mov ax, 4C00h                ; Program sonlandýrma kodu
    int 21h                      ; DOS interrupt çaðrýsý

ends

end start
