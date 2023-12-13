.model small
.stack 100H
.386
.data
ARRAY dw 20 DUP(?)
DATA1 dw 0000H
NUMB dw 0000H
msg db 10,13,"Enter the size of the array: $"
msg2 db 10,13,"Enter the element of the array: $"
msg3 db 10,13,"The stored array is: $"ta
.code
.startup
mov ah,09h
mov dx,offset msg
int 21h
mov ah,01h
int 21h
sub al,30h
mov ah,0
mov cx,ax
mov DATA1 ,ax
mov ah,09h
mov dx,offset msg2
int 21h
mov ah,0
mov si,0
mov bx,offset ARRAY
L1: mov dl,0AH
mov ah,02h
int 21h
mov dx,si
mov ah,01h
int 21h
sub al,30h
mov si,dx
mov [bx+si],ax
INC si
LOOP L1
mov cx,DATA1
mov bx,offset ARRAY
mov di,cx
L2: mov cx,DATA1
mov NUMB,cx
DEC NUMB
mov cx,NUMB
mov si,0
L3: mov al,[bx+si]
cmp [bx+si+1],al
jl L4
xchg al,[bx+si+1]
mov [bx+si],al
L4: inc si
LOOP L3
DEC DI
JNZ L2
MOV CX, DATA1
MOV SI, DATA1
dec SI
MOV BX, OFFSET ARRAY
 MOV AH,09
MOV DX, OFFSET msg3
INT 21H
 L5: MOV DL, 0AH
MOV AH, 02H
INT 21H
MOV DX, [BX + SI]
DEC si
ADD DL, 30H
 MOV AH, 02
INT 21H
 LOOP L5 
MOV AH, 4CH
 INT 21H
end
