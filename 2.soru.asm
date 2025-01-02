ORG 100h

; Veri tanýmlarý
BCD_VAL DB 29H    ; Packed BCD formatýnda giriþ
ASCII_NUM DB 2 DUP(0) ; ASCII formatýnda sonuç için yer (örneðin, '29')

START:
    MOV AL, BCD_VAL ; Packed BCD deðerini AL'e yükle

    ; Yüksek nibble'ý ayýr
    MOV AH, AL      ; AL'in bir kopyasýný AH'e al
    SHR AH, 4       ; Yüksek nibble'ý düþük nibble konumuna getir
    ADD AH, '0'     ; ASCII formatýna çevir
    MOV ASCII_NUM, AH ; Sonucu ASCII_NUM'un ilk byte'ýna yaz

    ; Düþük nibble'ý ayýr
    AND AL, 0Fh     ; Yüksek nibble'ý temizle, sadece düþük nibble kalsýn
    ADD AL, '0'     ; ASCII formatýna çevir
    MOV ASCII_NUM + 1, AL ; Sonucu ASCII_NUM'un ikinci byte'ýna yaz

    ; Program sonu
    RET





