INCLUDE Irvine32.inc

.data
    a db 4
    b db 2
    x SDWORD ?
	y SDWORD ?
	z SDWORD ?
	promt db "Enter your numbers:",10,0
	promtx db "x: ",0
	promty db "y: ",0
	msgz db "z = ",0
	msgRnd db "For random numbers:",10,0

.code
pr1 PROC,lx:SDWORD,ly:SDWORD	;declararea procedurii pr1
	mov eax, ly
	mov ebx, lx
	add ebx, 100 
	cmp eax, ebx
	jg hgf
	unhgf:
		  mov ebx, ly
		  cdq
		  idiv lx
		  mov ly, ebx
		  mov eax, ly
		  sub eax, 91
		  jmp display
	hgf:
		  mov eax, lx
		  mov ebx, 4
		  mov edx, 0
		  imul ebx
		  mov ebx, ly
		  sub ebx, eax
		  mov lx, ebx
		  mov eax, lx
		  mov ebx, 2
		  mov edx, 0
		  imul ebx
          add eax, ly
		  jmp display
	display:
		mov edx,OFFSET msgz
		call WriteString
		call WriteInt
		call Crlf
		call Crlf
	RET
pr1 ENDP

main PROC				;procedura main			
	mov edx,OFFSET promt	; rezutatul pentru datele introduse		
	call WriteString	
	mov edx,OFFSET promtx
	call WriteString
	call ReadInt
	mov x,eax
	mov edx,OFFSET promty
	call WriteString
	call ReadInt
	mov y,eax
	invoke pr1,x,y
	
	mov edx,OFFSET msgRnd	;rezultatul pentru random32		
	call Randomize
	call Random32
	shr eax,3
	mov x,eax
	mov edx,OFFSET promtx
	call WriteString
	call WriteInt
	call Crlf
	call Random32
	shr eax,3
	mov y,eax
	mov edx,OFFSET promty
	call WriteString
	call WriteInt
	call Crlf
	invoke pr1,x,y

	mov edx,OFFSET msgRnd	;rezultatul pentru randomrange		
	mov eax,5000
	call RandomRange
	mov x,eax
	mov edx,OFFSET promtx
	call WriteString
	mov edx,3
	call WriteInt
	call Crlf
	mov eax,5000
	call RandomRange
	mov y,eax
	mov edx,OFFSET promty
	call WriteString
	call WriteInt
	call Crlf
	invoke pr1,x,y
	
	exit 
main ENDP
END main
