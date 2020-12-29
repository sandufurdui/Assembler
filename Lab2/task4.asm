INCLUDE Irvine32.inc
 
print MACRO     ;declararea macro-ului
    mov ecx,20    ;muta in ecx valoarea 20
    lp1:          ;initializarea primei bucle
        push ecx      ;muta valoarea din ecx in stiva
        mov ecx,75    ;muta in ecx valoarea 75 
        mov edx,0     ;anuleaza edx
        lp2:             ;delcararea celei de-a doua bulca  
            mov al,string[edx]   ;in al elementul 0 din sir
            call WriteChar        ; cheama procedura writechar
            inc edx              ;incrementeaza edx, adica e indicele urmatorului element
            cmp edx,10            ;compara edx cu 10
            jnz ifend             ;daca edx egal cu 0, sare la ifend 
            mov edx,0             ;anuleaza edx
            ifend:                
        loop lp2               ;reintoarece la lp2
        
        call Crlf              ;sfarsitul liniei
        pop ecx 
    loop lp1;                  ;reintoarcere la lp1
ENDM
 
.data
    string db 10 DUP(?)
    msg db "Caracterul ",0
    colon db ':'
 
.code
main PROC
    mov ecx,10
    loop1:
        mov edx, OFFSET msg
        call WriteString
        mov eax,11
        sub eax,ecx
        call WriteDec
        mov al,colon
        call WriteChar
        call ReadChar
        call WriteChar
        mov edx,10
        sub edx,ecx
        mov string[edx],al
        call Crlf
    loop loop1;
    
    print
 
    exit 
main ENDP
END main
