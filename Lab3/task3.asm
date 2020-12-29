INCLUDE Irvine32.inc
.data                    
N=5                    ;lungimea sirului setata la 5
mas    byte    5 dup (3 dup (0))
.code                    
main proc                ;startul programului
    xor    eax,eax            ;anuleaza eax
    mov    esi,0            ;anuleaza esi
    mov    ecx,N            ;muta n in ecx
go:
    mov    dl,mas[esi]        ;muta primul bit din sir in dl
    inc    dl                ;incrementeaza dl
    mov    mas[esi],dl        ;scrierea inapoi in sir
    add    esi,3            ;aduna esi cu 3, adica trece la urmatorul element cu pozitie mai mare cu 3
    loop    go            ;repeta bucla
    mov    esi,0            ;anularea esi
    mov    ecx,N
show:                    ;afisarea la ecran continutul primului camp de octeti
    movsx eax,mas[esi]        
    call  WriteDec
    add    esi,3
 
    loop    show
quit:
    call  crlf
    exit 
main ENDP
END main  
