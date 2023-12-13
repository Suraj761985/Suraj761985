.model small
.stack 100H
.386
.data
ARRAY dw 20 DUP (?)
DATA1 dw 0000H
DATA2 dw 0000H
success db 10,13,"Element is present in the array $"
fail db 10,13,"Element is not present in the arary $"
msg db 10,13,"Enter the size of the array: $"
msg2 db 10,13,"Enter the elements of array: $"
msg3 db 10,13,"Enter the element to be searched: $"
msg4 db 10,13,"at index: $"
.code
.startup
;(1) for reading size of array
MOV AH,09
MOV DX,OFFSET msg
INT 21H
MOV AH,01
INT 21H
SUB AL,30H
MOV AH,0
MOV CX,AX
MOV DATA1,AX ;DATA1 and CX contains size of Array entered by user
;(2) for reading elements in the array
MOV AH,09
MOV DX,OFFSET msg2
INT 21H
MOV AH,0
MOV SI,0
MOV BX, OFFSET ARRAY
L1: MOV DL, 0AH ;jump onto next line
MOV AH, 02H
INT 21H
MOV DX, SI ;input element of the array
MOV AH, 01H
INT 21H
SUB AL,30H
MOV [BX + SI], AX
INC SI
LOOP L1
; (3) for reading element to be searched
MOV AH,09
MOV DX,OFFSET msg3
INT 21H
MOV AH,01 ;Enter element to be searched
INT 21H
SUB AL,30H
; (4) for performing the Binary search and displaying the appropriate output
MOV DATA2,AX
MOV CX,DATA1
MOV SI,0
MOV DI, DATA1
MOV BP, 0
MOV BX, OFFSET ARRAY
MOV AX, DATA1
L2: MOV SI, DI
ADD SI, BP
MOV AX, SI
MOV DL, 2
DIV DL
MOV AH,0
MOV DX,0
MOV SI,AX
MOV DX,DATA2
CMP [BX + SI],DL
JZ L3
CALL L4
LOOP L2
MOV AH, 09H
MOV DX,OFFSET fail ; if the element is not found
INT 21H
MOV AH, 4CH ; to forcefully terminate the program
INT 21H
L3: MOV AH, 09H 
MOV DX,OFFSET success ; if the element is found
INT 21H
MOV AH, 09H
MOV DX,OFFSET msg4
INT 21H
MOV DX,SI
ADD DX,30H
ADD DX,01
MOV AH, 02
INT 21H
MOV AH, 4CH
INT 21H
L4 PROC NEAR
CMP [BX+SI], DL
JL L6
MOV DI, SI
RET
L6: MOV BP,SI
RET
L4 ENDP
MOV AH, 4CH
INT 21H
END
