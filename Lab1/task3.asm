INCLUDE Irvine32.inc
.DATA
val      EQU      0aah
vect     DW       111h,222h,333h

.CODE
main PROC
        mov      al,val					; inscrierea valorii 0aah in registrul al
        mov      BYTE PTR vect[1],al	;transferearea
        mov      BYTE PTR vect[3],al	;valorii
        mov      BYTE PTR vect[5],al	;in octeți
   exit
main ENDP
END main  
