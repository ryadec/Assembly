TITLE Template 

Comment @
Program Description :?
Author : Ryan DeCosmo
Creation Date : 
Revisions :?
Date : ?
@


Include Irvine32.inc


.data			; ( insert variables here )
 

runs dword 2,1,9,2,7,4,4,0,7,3,10,4,2,1,14   ;88
runs2 dword 5,10,4,10,7,3,7,6,8,0,5,2,5,4,0,7,6  ;76
runs3 dword 1,0,5,7,3,5,3,2,4,3,5,9,1,1,8,8,3,1,5,2,4;
count byte 15 dup(0)
sum dword 0
num byte 0
blank byte ' ',0  
star byte "*",0
msg1 byte "There were: ",0
msg2 byte "'s",0 
msg3 byte " The total is: ",0
.code
main PROC	; (insert executable instructions here)
     
	mov esi, 0 ;offset runs
	mov ecx, lengthof runs
	mov edx, offset blank
    mov edi, 0
	L1:
		mov ebx, runs[edi]
		mov eax, ebx
		mov esi, ebx
		inc count[esi] 
		add sum, eax
		call writedec
		call writestring
		
	    add edi, 4
	loop L1
	;---------------------------
		mov esi, 0 ;offset runs
	mov ecx, lengthof runs2
	mov edx, offset blank
    mov edi, 0
	L2:
		mov ebx, runs2[edi]
		mov eax, ebx
		mov esi, ebx
		inc count[esi] 
		add sum, eax
		call writedec
		call writestring
		
	    add edi, 4
	loop L2
	;--------------------------------
		mov esi, 0 ;offset runs
	mov ecx, lengthof runs3
	mov edx, offset blank
    mov edi, 0
	L3:
		mov ebx, runs3[edi]
		mov eax, ebx
		mov esi, ebx
		inc count[esi] 
		add sum, eax
		call writedec
		call writestring
		
	    add edi, 4
	loop L3

	;----------------------------------------
	call crlf
	call crlf
	call crlf
	mov edx, offset msg3
	call writestring
    mov eax, sum
	call writedec
;-----------------------------
	call crlf
	call crlf
	call crlf
	
;--------------------------- PRINT OUT THE COUNT
	mov edx, offset blank
	mov edi, 0
	mov ecx, 15
	mov eax, 0
	L4:
		movzx ebx, count[edi]
		
		mov edx, offset msg1
		call writestring
		
		mov eax, ebx
		call writedec
		
		mov edx, offset blank
		call writestring
		call writestring
		
		movzx eax, num
		call writedec
		
		mov edx, offset msg2
		call writestring
		
		mov edx, offset blank
		call writestring
		
		call crlf
		
		inc edi
	    inc num
	loop L4
	
	
	;call printChart

       
 
exit


	main ENDP
			; (insert additional procedures here)			

END main