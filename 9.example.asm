data segment
    text db "Halic University", 0  ; Metin dizisi, sonland�r�c� karakter olarak 0 eklendi
    part1 db 5 dup(" ")               ; �lk par�a i�in alan
    part2 db 10 dup(" ")              ; �kinci par�a i�in alan
ends

stack segment
    dw 128 dup(0)                      ; Y���n alan�
ends

code segment
start:
    mov ax, data                       ; Veri segmentini ayarla
    mov ds, ax                         ; DS'yi veri segmentine ayarla
    mov es, ax                         ; ES'yi veri segmentine ayarla

    lea si, text                      ; Kaynak metin ba�lang�c�
    lea di, part1                     ; �lk par�a i�in hedef adres
    mov al, " "
    mov cx, 18                         ; Metnin uzunlu�u (karakter say�s�)

next_character:
    movsb                              ; Metindeki bir karakteri AL'ye y�kle
    cmp al, [si]                        ; Bo�luk karakteri mi?
    je secondpart                     ; Bo�luksa ikinci par�aya ge�
    stosb                              ; AL'yi parca1'e yaz
    loop next_character                ; Bir sonraki karaktere ge�

secondpart:
    inc si
    lea di, part2                     ; �kinci par�a i�in hedef adres                              ; Bo�lu�u atla
    rep movsb 
    jmp finish                         ; Kalan metni ikinci par�aya kopyala

finish:
    mov ax, 4C00h                      ; Program� sonland�r
    int 21h

ends
end start
