INCLUDE Irvine32.inc
.DATA
vect WORD 100h,200h,300h

.CODE
main PROC
    mov     dx,vect		; inscrierea in dx  primului cuvant din vect
    mov     ax,vect+2	; inscrierea celui de-al doilea cuvant
    mov     vect,ax		; in adresa primului
    mov     ax,vect+4	; inscrierea celui de-al treilea cuvant
    mov     vect+2,ax	;  in adresa celui de-al doilea
    mov     vect+4,dx	; scrierea primului cuvant in adresa celui de-al treilea
     exit
main ENDP
END main
