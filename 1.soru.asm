ORG 100h

ASCII_NUM DB '29', 0 ; Giriþ ASCII formatýnda
BCD_VAL DB 0         ; Packed BCD formatý için çýktý alaný

START:
    LEA SI, ASCII_NUM ; ASCII giriþ adresini SI'ye yükle
    MOV AL, [SI]      ; Ýlk ASCII karakterini AL'e yükle
    SUB AL, '0'       ; Ýlk karakteri sayýya çevir
    SHL AL, 4         ; Sayýyý yüksek nibble'a taþý

    INC SI            ; Giriþin ikinci karakterine ilerle
    MOV BL, [SI]      ; Ýkinci ASCII karakterini BL'e yükle
    SUB BL, '0'       ; Ýkinci karakteri sayýya çevir
    OR AL, BL         ; AL'deki yüksek nibble ile BL'deki düþük nibble'ý birleþtir

    MOV BCD_VAL, AL   ; Packed BCD sonucu BCD_VAL'a kaydet

    ; Çýkýþý göster
    MOV AL, BCD_VAL     ; Packed BCD deðerini AL'e al
    MOV DL, AL          ; DL'e yükle
    MOV AH, 02h         ; Ekrana yazdýrma fonksiyonu
    INT 21h             ; BIOS interrupt

    RET





