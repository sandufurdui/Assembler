INCLUDE Irvine32.inc
.data
mes    db     0ah,0dh,'String - ',0
mas    db     10 dup (?),0                                       ;sirul initial
i      db     0
.code
main proc
       xor    eax,eax                                                 ;anularea eax
       mov    ecx,10                                              ;muta in ecx valoarea 10
       mov    esi,0                                               ;anuleaza esi
go:                                                                  ;ciclu de initiere
       mov    bh,i                                                ;mută i in bh
       mov    mas[esi],bh                                         ;scrierea in masiv valoarea bh
       inc    i                                                       ;incrementeaza i
       inc    esi                                                     ;incrementeaza esi     
       loop   go                                                  ;repeta ciclul
                                                                     ;scrierea la ecran a masivului
       mov   edx,OFFSET mes 
       call  WriteString
 
       mov    ecx,10
       mov    esi,0
show:
       movsx eax,mas[esi]         
       call  WriteDec
       inc    esi
       loop   show
quit:
       call  crlf
       exit
main ENDP
END main
