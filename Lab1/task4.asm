INCLUDE Irvine32.inc
.DATA
    bcd1   BYTE      34h,18h	; 1834 impachetat in format BCD 
    bcd2   BYTE      89h,27h	; 2789 impachetat in format BCD
    sum    BYTE  2     DUP(?)
    dif    BYTE  2     DUP(?)
.CODE
main PROC
    mov     al,bcd1				; al <= 34
    add     al,bcd2				; al = 34+89 = bd
    daa				; Decimal Adjust AL after Addition – corectarea zecimala BCD dupa adunare
								; al <= 23
    mov     sum,al				; sum[0] <= 23
    mov     al,bcd1+1			; al <= 18
    adc     al,bcd2+1			; al <= 18 + 27 + 1 = 40
    daa				; Decimal Adjust AL after Addition – corectarea zecimala BCD dupa adunare
								; al <= 46
    mov     sum+1,al			; sum[1] <= 46 => sum = 4623
    
    mov     al,bcd1				; al <= 34
    sub     al,bcd2				; al = 34-89 = ab
    das			; Decimal Adjust AL after Subtraction – corectarea zecimala BCD dupa scadere
								; al <= 45
    mov     dif,al				; dif[0] <= 45
    mov     al,bcd1+1			; al <= 18
    sbb     al,bcd2+1			; al <= 18 - 27 - 1 = f0
    das			; Decimal Adjust AL after Subtraction – corectarea zecimala BCD dupa sccadere
			; al <= 90
    mov     dif+1,al			; dif[1] <= 90 => dif = 9045
       exit
main ENDP
END main
