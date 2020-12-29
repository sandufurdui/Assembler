INCLUDE Irvine32.inc
 
.data
    pos DB  'This_is_a_sequence!'
    l   EQU sizeof pos
                       
.code
main proc
    mov  ecx,l
    mov  esi,0
    mov  al,' '
    sld:  
inc esi
          cmp al,pos[esi]
    loopne  sld
    jne not_found
    mov eax,l
    sub eax,ecx
    jmp brk
    not_found: mov eax,-1
    brk:  nop
                              
               exit
main ENDP
END main
