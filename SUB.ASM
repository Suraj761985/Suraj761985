Code:
.model small
.stack 100h
.386
.data
data1 dd 00H
str1 db 10,13,"Enter the first no.:: $"
str2 db 10,13,"Enter the second no.:: $"
dif db 10,13,"The difference is: $"
.code 
.startup
mov EBX,00000000
mov AH,09
mov DX,offset str1
int 21h
mov ECX,8
AGAIN: 
MOV AH, 01
INT 21H
CMP AL, 'A'
JGE L5
SUB AL,30H
JMP L6
L5: SUB AL,37H
L6: SHL EBX,4
ADD BL,AL
LOOP AGAIN
MOV data1,EBX
mov AH,09
MOV DX,OFFSET str2
INT 21H
MOV ECX, 8
AGAIN2: 
MOV AH, 01
INT 21H
CMP AL, 'A'
JGE L7
SUB AL,30H
JMP L8
L7: SUB AL,37H
L8: SHL EBX,4
ADD BL,AL
LOOP AGAIN2
SUB data1,EBX
MOV EBX,data1
mov AH,09
mov DX,offset str2
int 21h
MOV ECX, 8
AGAIN3: ROL EBX, 4
MOV EDX,EBX
AND DX, 0FH
CMP DX, 09
JG L9
ADD DL,30H
JMP L10
L9: ADD DL, 37H
L10: MOV AH,02
INT 21H
LOOP AGAIN3
 
 MOV AH,4CH
 INT 21H
End
