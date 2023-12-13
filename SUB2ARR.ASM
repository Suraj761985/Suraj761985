.model small 
.386
.data 
A1 DB 20 DUP (?) 
A2 DB 20 DUP (?) 
DATA1 dw 0000H
DATA2 DW 0000H
msg db 10,13,"Enter the size of the arrays :: $"
msg2 db 10,13,"Enter the first array :: $"
msg3 db 10,13,"The entered array is :: $"
msg4 db 10,13, "Enter the second array ::$"
msg5 db 10,13, "The difference of both array is ::$"
.code 
.startup 
;Display msg
MOV AH,09
MOV DX,OFFSET msg 
INT 21H
;Input the size of the array in DATA1
MOV CX, 2
L4: MOV AH,01
INT 21H
CMP AL,'A'
JGE L9 
SUB AL,30H
JMP L8 
L9: SUB AL,37H
L8: SHL BX, 4
ADD BL, AL
LOOP L4 
MOV AL, BL
MOV CL, AL
MOV AH, 0
MOV DATA1, AX
MOV CX, DATA1 
;Display msg2
MOV AH,09
MOV DX,OFFSET msg2 
INT 21H
MOV AH,0
;Input the first array
MOV CX, DATA1 
LEA SI, A1 
L1: MOV DL, 0AH ; jump onto next line
MOV AH, 02H
INT 21H
MOV AH, 01H
INT 21H
SUB AL,30H
MOV [SI], AL
INC SI
LOOP L1 
;Display msg3
MOV AH, 09H
MOV DX, OFFSET MSG3 
INT 21H
;Display the first array
MOV CX, DATA1 
LEA SI, A1 
L2:mov ah, 02h
mov dl, 0ah
int 21h
MOV DL, [SI] 
ADD DL, 30h
MOV AH, 02
INT 21H
INC SI
LOOP L2 
MOV CX, DATA1 
;Display msg4
MOV AH,09
MOV DX,OFFSET msg4 
INT 21H
MOV AH,0
;Input the second array
LEA DI, A2 
L3: MOV DL, 0AH ; jump onto next line
MOV AH, 02H
INT 21H
MOV AH, 01H
INT 21H
SUB AL,30H
MOV [DI], AL
INC DI
LOOP L3 
;Display msg3
MOV AH, 09H
MOV DX, OFFSET MSG3 
INT 21H
;Display the second array
MOV CX, DATA1 
LEA DI, A2 
L14:mov ah, 02h
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h
MOV DX, [DI] 
ADD DL, 30h
MOV AH, 02
INT 21H
INC DI
LOOP L14 
;Subtraction
LEA SI, A1 
LEA DI, A2 
MOV CX, DATA1 
ADDA: MOV AL, [SI] 
SUB AL, [DI] 
MOV [SI], AL
INC DI
INC SI
LOOP ADDA 
MOV AH, 09H
MOV DX, OFFSET MSG5 
INT 21H
MOV CX, DATA1 
LEA SI, A1 
L5:mov ah, 02h
mov dl, 0ah
int 21h
MOV DATA2, CX
MOV CX, 2
MOV BL, [SI] 
ADDA1: ROL BL, 4
MOV DL, BL
AND DL, 0FH
CMP Dl, 9
JA L6 
ADD DL, 30h
JMP L7 
L6: ADD DL, 37H
L7: MOV AH, 02
INT 21H
LOOP ADDA1 
MOV CX, DATA2 
INC SI
LOOP L5 
END