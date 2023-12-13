.model small
.stack 100h
.386
.data
num1 dd 00000000h
num2 dd 00000000h
num3 dd 00000000h
msg db 10,13,"Enter the first number: $"
msg1 db 10,13,"Enter the second number: $"
msg2 db 10,13,"The sum is: $"
.code
.startup
mov ah,09
mov dx,offset msg
int 21h
mov ebx,0
mov cx,8
again: mov ah,01
int 21h
cmp al,'A'
jge l2
sub al,30h
shl ebx,4
sub bl,al
loop again
mov num1,ebx
mov ah,09
mov dx,offset msg1
int 21h
mov ebx,0
mov cx,8
again1: mov ah,01
int 21h
cmp al,'A'
jge l2
sub al,30h
shl ebx,4
sub bl,al
loop again1
mov num2,ebx
mov ax,word ptr num1
mov dx,word ptr num2
sub al,dl
das
mov bl,al
mov al,ah
sbb al,dh
das
mov bh,al
mov word ptr num3,bx
mov ax,word ptr num1+2
mov dx,word ptr num2+2
sbb al,dl
das
mov bl,al
mov al,ah
sbb al,dh
das
mov bh,al
mov word ptr num3+2,bx
mov ebx,num3
mov ah,09h
mov dx,offset msg2
int 21h
jnc l6
mov ah,02h
mov dl,"1"
int 21h
l6:
mov cx,8
again2:
rol ebx,4
mov dl,bl
and dl,0Fh
add dl,30h
mov ah,02
int 21h
loop again2
l2:mov ah,4ch
int 21h
End
