INCLUDE Irvine32.inc
 
.DATA
    bcd1      DB        22h,41h,75h,32h          ; 32754122
    bcd2      DB        31h,27h,53h,62h          ; 62532731
    n         EQU       lengthof bcd2
.CODE
main PROC
    lea  esi,bcd1
    lea  edi,bcd2
    mov  ecx,n
    clc
               cycle:    
                              mov  al,[esi]
                              adc  al,[edi]
                              daa
                              mov  [edi],al
                              inc  esi
                              inc  edi
    loop cycle
 
               exit
main ENDP
END main
