INCLUDE Irvine32.inc
 
.DATA
    asc1      DB        '7','5','2','1','3'; 31257
    asc2      DB        '6','1','9','9','5'; 59916
    l         EQU       sizeof  asc1
 
.CODE
main PROC
        lea       esi,asc1
        lea       edi,asc2
        mov       ecx,l
        clc
    cycle:    
                mov       al,[esi]
        adc       al,[edi]
        aaa
        mov       [edi],al
        inc       esi
        inc       edi
    loop      cycle                
               exit
main ENDP
END main
