ORG 100h

; Veri tanýmlarý
lowSignificant DB 0  ; Düþük anlamlý baytýn saklanacaðý yer
highSignificant DB 0 ; Yüksek anlamlý baytýn saklanacaðý yer

START:
    ; Yýðýta (stack) örnek verileri yerleþtirme
    MOV AX, 2244h     ; Ýlk veri
    PUSH AX           ; Stack'e yerleþtir
    MOV AX, 3366h     ; Ýkinci veri
    PUSH AX           ; Stack'e yerleþtir

    ; Yýðýttaki ilk veriyi (en son yerleþtirileni) yükleme
    POP AX            ; AX = 3366h
    MOV BL, AL        ; AX'in düþük baytýný BL'e al
    MOV lowSignificant, BL ; Düþük anlamlý baytý kaydet
    MOV BH, AH        ; AX'in yüksek baytýný BH'e al
    MOV highSignificant, BH ; Yüksek anlamlý baytý kaydet

    ; Yýðýttaki ikinci veriyi yükleme
    POP AX            ; AX = 2244h
    MOV BL, AL        ; AX'in düþük baytýný BL'e al
    MOV lowSignificant + 1, BL ; Ýkinci düþük anlamlý baytý kaydet
    MOV BH, AH        ; AX'in yüksek baytýný BH'e al
    MOV highSignificant + 1, BH ; Ýkinci yüksek anlamlý baytý kaydet

    ; Program sonu
    RET





