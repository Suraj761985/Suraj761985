.model SMALL
.stack 100H
.data
intputStr db 10,13, 'Enter an ASCII Character: $'
outputStr db 10,13, 'Enter equivalent is : $'
.code 
.startup
MOV DX, OFFSET intputStr
MOV AH, 09H
INT 21H
MOV AH, 01H
INT 21H
MOV BL,AL
MOV DX, OFFSET outputStr
MOV AH,09H
INT 21H
MOV CX, 8
repeat8Times:
SHL BL,1
JC printOne
MOV DL, 30H
JMP print
printOne:
MOV DL, 31H
print:
MOV AH, 02H
INT 21H
LOOP repeat8Times
MOV AH, 4CH
INT 21H
END
