
org 100h

mov cl,0
mov ch,8

start:
shl numbers,1
jc onefound
cmp ch,0
jz endpro
dec ch
jmp start

onefound:
inc [numberone]
jmp start

endpro:

ret
       
numbers db 00111000b
numberone db 0



