Irvine32.inc
reverse MACRO a, b
LOCAL reverse
    mov ecx, b
     dec ecx
reverse:
    mov al, a[ecx] 
    call WriteChar
    sub ecx, 1
    jnc reverse
ENDM
 
.data
string byte  "asdfghjkl", 0
stringSize DD 0
msg1 db "Normal: ",0;
msg2 db "Inversat: ",0;
 
 
.code
main proc
     mov edx ,OFFSET string
     call WriteString
    call Crlf
 
     mov edx, OFFSET string
     mov ecx, SIZEOF string
    mov stringSize, eax
    mov esi, -1
    mov al, '@'
 
fend:
    inc  esi                  
    cmp  al, string[esi]
    loopne fend     
    mov stringSize, esi 
    call Crlf
    reverse string, stringSize
    call Crlf
    call readchar
 
    exit
main ENDP
END 
