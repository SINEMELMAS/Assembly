data segment
    text db "Halic University", 0  ; Metin dizisi, sonlandýrýcý karakter olarak 0 eklendi
    part1 db 5 dup(" ")               ; Ýlk parça için alan
    part2 db 10 dup(" ")              ; Ýkinci parça için alan
ends

stack segment
    dw 128 dup(0)                      ; Yýðýn alaný
ends

code segment
start:
    mov ax, data                       ; Veri segmentini ayarla
    mov ds, ax                         ; DS'yi veri segmentine ayarla
    mov es, ax                         ; ES'yi veri segmentine ayarla

    lea si, text                      ; Kaynak metin baþlangýcý
    lea di, part1                     ; Ýlk parça için hedef adres
    mov al, " "
    mov cx, 18                         ; Metnin uzunluðu (karakter sayýsý)

next_character:
    movsb                              ; Metindeki bir karakteri AL'ye yükle
    cmp al, [si]                        ; Boþluk karakteri mi?
    je secondpart                     ; Boþluksa ikinci parçaya geç
    stosb                              ; AL'yi parca1'e yaz
    loop next_character                ; Bir sonraki karaktere geç

secondpart:
    inc si
    lea di, part2                     ; Ýkinci parça için hedef adres                              ; Boþluðu atla
    rep movsb 
    jmp finish                         ; Kalan metni ikinci parçaya kopyala

finish:
    mov ax, 4C00h                      ; Programý sonlandýr
    int 21h

ends
end start
