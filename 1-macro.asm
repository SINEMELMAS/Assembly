org 100h

ascii_to_bcd macro
    and ax, 0F0Fh         ; Sadece düþük nibble'lardaki sayýsal deðerleri al
    mov cl, 4             ; 4 bit kaydýrma miktarýný CL'e yükle
    shl ah, cl            ; AH'yi 4 bit sola kaydýr (yüksek nibble'a taþýr)
    or ah, al             ; AH (yüksek nibble) ve AL (düþük nibble) birleþir
    mov al, ah            ; Sonucu AL'ye kaydet (Packed BCD)
endm

start:
    mov ax, '47'          ; AX'e '47' ASCII deðeri yükle
    ascii_to_bcd          ; Macro ile dönüþüm iþlemi yap
    ret                   ; Programý sonlandýr

