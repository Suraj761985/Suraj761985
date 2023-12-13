.model small 
.stack 100H 
.data 
inputstr db 10,13, 'Enter Binary numbes: $'
outputstr db 10,13, 'The ASCII characters: $' 
.code 
.startup 
mov ah, 09h
mov dx, offset inputstr 
int 21h 
mov bl, 00h 
mov cl, 08h 
repeat: 
mov ah, 01h 
int 21h
sub al, 30h 
shl bl, 1 
add bl, al 
loop repeat 
mov ah, 09h
mov dx,offset outputstr
int 21h 
mov ah, 02h 
mov dl, bl 
int 21h
mov ah, 4ch 
int 21h
END 