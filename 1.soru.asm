ORG 100h

ASCII_NUM DB '29', 0 ; Giri� ASCII format�nda
BCD_VAL DB 0         ; Packed BCD format� i�in ��kt� alan�

START:
    LEA SI, ASCII_NUM ; ASCII giri� adresini SI'ye y�kle
    MOV AL, [SI]      ; �lk ASCII karakterini AL'e y�kle
    SUB AL, '0'       ; �lk karakteri say�ya �evir
    SHL AL, 4         ; Say�y� y�ksek nibble'a ta��

    INC SI            ; Giri�in ikinci karakterine ilerle
    MOV BL, [SI]      ; �kinci ASCII karakterini BL'e y�kle
    SUB BL, '0'       ; �kinci karakteri say�ya �evir
    OR AL, BL         ; AL'deki y�ksek nibble ile BL'deki d���k nibble'� birle�tir

    MOV BCD_VAL, AL   ; Packed BCD sonucu BCD_VAL'a kaydet

    ; ��k��� g�ster
    MOV AL, BCD_VAL     ; Packed BCD de�erini AL'e al
    MOV DL, AL          ; DL'e y�kle
    MOV AH, 02h         ; Ekrana yazd�rma fonksiyonu
    INT 21h             ; BIOS interrupt

    RET





