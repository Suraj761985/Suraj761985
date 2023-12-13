.model small
.stack 100H
.386
.data
ARRAY dw 20 DUP (?)
DATA1 dw 0000H
success db 10,13,"Element is present in the array $"
fail db 10,13,"Element is not present in array $"
msg db 10,13, "Enter the size of the array:$"
msg2 db 10,13,"Enter the elements of array: $"
msg3 db 10,13, "Enter the elements to be searched:$"
msg4 db 10,13,"at index: $"
.code
.startup
MOV AH,09
MOV DX,OFFSET msg
INT 21H
MOV AH,01
INT 21H
SUB AL,30H
MOV AH,0
MOV CX,AX
MOV DATA1,AX
MOV AH,09
MOV DX,OFFSET msg2
INT 21H
MOV AH,0
MOV SI,0
MOV BX,OFFSET ARRAY
L1: MOV DL,0AH
MOV AH,02H
INT 21H
MOV DX,SI
MOV AH,01H
INT 21H
SUB AL,30H
MOV [BX+SI], AX
INC SI
LOOP L1
MOV CX,DATA1
MOV AH,09
MOV DX,OFFSET msg3
INT 21H
MOV AH,01
INT 21H
SUB AL,30H
MOV SI,0
MOV BX, OFFSET ARRAY
L2: CMP [BX+SI], AL
JZ L3
INC SI
LOOP L2
MOV AH,09H
MOV DX,OFFSET fail 
INT 21H
MOV AH, 4CH
INT 21H
L3: MOV AH,09H
MOV DX,OFFSET success
INT 21H
MOV AH, 09H
MOV DX,OFFSET msg4
INT 21H
MOV DX,SI
ADD DX,30H
MOV AH,02
INT 21H
MOV AH,4CH
INT 21H
END
