
org 100h
  lea si, buffer
  mov cx,5
  
takech:
  mov ah, 01h
  int 21h
  mov [si],al
  inc si
  loop takech

ret
buffer db 5 (?)



