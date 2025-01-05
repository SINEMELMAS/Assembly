org 100h

ascii_to_bcd macro
    and ax, 0F0Fh         ; Sadece d���k nibble'lardaki say�sal de�erleri al
    mov cl, 4             ; 4 bit kayd�rma miktar�n� CL'e y�kle
    shl ah, cl            ; AH'yi 4 bit sola kayd�r (y�ksek nibble'a ta��r)
    or ah, al             ; AH (y�ksek nibble) ve AL (d���k nibble) birle�ir
    mov al, ah            ; Sonucu AL'ye kaydet (Packed BCD)
endm

start:
    mov ax, '47'          ; AX'e '47' ASCII de�eri y�kle
    ascii_to_bcd          ; Macro ile d�n���m i�lemi yap
    ret                   ; Program� sonland�r

