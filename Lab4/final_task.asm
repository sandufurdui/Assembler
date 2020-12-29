include irvine16.inc 
 
        .DATA           
 
        .CODE
MAIN    PROC    FAR
    MOV     AX, @DATA
    MOV     DS, AX
 
    MOV     AX, 0600h    ;ridica pagina in sus
 
    
    ;pentru culoarea gri
    MOV     BH, 7Fh    ;determina culoarea
    MOV     CX, 0100h   ;determina randul, in cazul dat, primul rand
    MOV     DX, 014Fh   ;sfarsitul liniei
    INT     10h
 ;se repeta pasii de sus pentru restul culorilor, schimband doar codul din primul rand
;pentru albastru
    MOV     BH, 1Fh
    MOV     CX, 0200h
    MOV     DX, 024Fh
    INT     10h
 
     ;pentru rosu
    MOV     BH, 4Fh
    MOV     CX, 0300h
    MOV     DX, 034Fh
    INT     10h
    MOV     AX, 4C00h
    INT         21h                         
MAIN    ENDP
        END     MAIN
