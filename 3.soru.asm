ORG 100h

; Veri tan�mlar�
lowSignificant DB 0  ; D���k anlaml� bayt�n saklanaca�� yer
highSignificant DB 0 ; Y�ksek anlaml� bayt�n saklanaca�� yer

START:
    ; Y���ta (stack) �rnek verileri yerle�tirme
    MOV AX, 2244h     ; �lk veri
    PUSH AX           ; Stack'e yerle�tir
    MOV AX, 3366h     ; �kinci veri
    PUSH AX           ; Stack'e yerle�tir

    ; Y���ttaki ilk veriyi (en son yerle�tirileni) y�kleme
    POP AX            ; AX = 3366h
    MOV BL, AL        ; AX'in d���k bayt�n� BL'e al
    MOV lowSignificant, BL ; D���k anlaml� bayt� kaydet
    MOV BH, AH        ; AX'in y�ksek bayt�n� BH'e al
    MOV highSignificant, BH ; Y�ksek anlaml� bayt� kaydet

    ; Y���ttaki ikinci veriyi y�kleme
    POP AX            ; AX = 2244h
    MOV BL, AL        ; AX'in d���k bayt�n� BL'e al
    MOV lowSignificant + 1, BL ; �kinci d���k anlaml� bayt� kaydet
    MOV BH, AH        ; AX'in y�ksek bayt�n� BH'e al
    MOV highSignificant + 1, BH ; �kinci y�ksek anlaml� bayt� kaydet

    ; Program sonu
    RET





