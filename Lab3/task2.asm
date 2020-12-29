INCLUDE Irvine32.inc
.data  
;тексты сообщений:
mes1   db     ' not equal 0!',0ah,0dh,0
mes2   db     ' equal 0!',0ah,0dh,0
mes3   db     0ah,0dh,'Element ',0
mas    dw     2,7,0,0,1,9,3,6,0,8                          ;sirul initial
.code
main proc
       xor    eax,eax                                               ;anularea ax
prepare:
       mov    ecx,10                                                  ;muta in ecx valoarea 10
       mov    esi,0                                                     ;anuleaza esi
compare:
       mov    dx,mas[esi*2]                                   ;primul element din sir in dx
       cmp    dx,0                                            ;compara dx cu 0
       je     equal                                           ;trece mai departe egal
not_equal:                                                   ;daca nu egal
       mov   edx,OFFSET mes3      
       call  WriteString                                             ;afisarea sirului la ecran
       mov eax,esi                                                ;afisarea numarului elementului din sir la ecran  
       call  WriteDec
       mov   edx,OFFSET mes1      
       call  WriteString
       inc    esi                                                    ;incrementeaza esi
       dec    ecx                                                    ;conditia pentru break
       jecxz  quit                                        ;compara ecx cu 0, daca da, atunci iese din ciclu
       jmp    compare                                             
equal:              
       mov   edx,OFFSET mes3                                         ;afisarea mesajului mes 3 la ecran
       call  WriteString
       mov eax,esi         
       call  WriteDec
       mov   edx,OFFSET mes2                                               ;afisarea mesajului mes2 la ecran
       call  WriteString
       inc    esi                                                              ;incrementeaza esi, adica trece la urmatorul element
       dec    ecx                                                   
       jecxz  quit
       jmp    compare
quit:
       call  crlf
       exit
main ENDP
END main 
