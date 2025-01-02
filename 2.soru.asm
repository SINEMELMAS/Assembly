ORG 100h

; Veri tan�mlar�
BCD_VAL DB 29H    ; Packed BCD format�nda giri�
ASCII_NUM DB 2 DUP(0) ; ASCII format�nda sonu� i�in yer (�rne�in, '29')

START:
    MOV AL, BCD_VAL ; Packed BCD de�erini AL'e y�kle

    ; Y�ksek nibble'� ay�r
    MOV AH, AL      ; AL'in bir kopyas�n� AH'e al
    SHR AH, 4       ; Y�ksek nibble'� d���k nibble konumuna getir
    ADD AH, '0'     ; ASCII format�na �evir
    MOV ASCII_NUM, AH ; Sonucu ASCII_NUM'un ilk byte'�na yaz

    ; D���k nibble'� ay�r
    AND AL, 0Fh     ; Y�ksek nibble'� temizle, sadece d���k nibble kals�n
    ADD AL, '0'     ; ASCII format�na �evir
    MOV ASCII_NUM + 1, AL ; Sonucu ASCII_NUM'un ikinci byte'�na yaz

    ; Program sonu
    RET





