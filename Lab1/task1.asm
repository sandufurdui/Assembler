INCLUDE Irvine32.inc
.data
mes1 byte "Enter the X:",0  
mes2 byte "Enter the Y:",0  
mes3 byte "Result:",0
vrx  dword 0
vry  dword 0
rez  dd 0

.code
main PROC
mov edx,OFFSET mes1
call WriteString   	; afisarea mes1
call ReadDec		; introducerea de la tastatura
mov vrx,eax			; salveaza valorile in vrx

mov edx,OFFSET mes2
call WriteString    	;afisarea la ecran a mes2
call ReadDec		; introducerea de la tastatura pentru a doua variabila
mov vry,eax			; salvarea in variabila vry 

;verificam conditiile
xor eax,eax			; anularea eax
mov edx,0

mov eax,vry
mov bx,2
mul bx				; Y*2
cmp vrx,eax			; compara X cu 2Y
jb con1				; trecerea la con1, daca X < 2Y

mov eax,vry			; 2Y-60
mov bx,2
mul bx
sub eax,60
mov rez,eax
jmp ex				; trecerea neconditionata la ex

con1: mov eax,vrx	; X/8+32-Y
mov bx,8
div bx
add eax,32
sub eax,vry
mov rez,eax

ex: mov edx,OFFSET mes3
call WriteString	         ; afisarea  mes3
call WriteInt		; afisarea rezultatului cu semn
call Crlf			; din rand nou
	
	exit
main ENDP
END main