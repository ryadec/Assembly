TITLE Mideterm Question 3 part A

Comment @
Program Description :?
Author : Ryan DeCosmo
Creation Date : 
Revisions :?
Date : ?
@


Include Irvine32.inc


.data			; ( insert variables here )

array dword 100 dup(0)
target dword 100 dup(0)
blank byte ' '
temp dword ?
line byte "-----------------------------------------------------------------",0
msg1 byte "The array of 100 random numbers from -10 to 10:",0
msg2 byte "The same array printed backwards:",0     
msg3 byte "The target array printed is:",0   
.code
main PROC	; (insert executable instructions here)
    ;------------------------------------------------------------------------
	;PART A: CREATE AN ARRAY OF RANDOM NUMBERS -10 to 10 AND PRINT THEM OUT  |
	;------------------------------------------------------------------------
	
	call randomize        ;gets random seed
	mov edx, offset blank ;this must be placed AFTER call randomize because randomize makes use of the edx register
	 
	mov esi, offset array
	mov ecx, 100
	mov edi, 0
	
	;puts creates random values and puts them in the array
	L1:
	 mov eax, 21              ;sets eax to 21 for the range because random range creates a random from 0 to n-1
	 call RandomRange         ; generates a random number from 0-20
	 sub eax,10               ;subtracts 10 from the random number, yielding a number from -10 to 10
	 mov [esi], eax

	 add esi,4
   loop L1
   ;---------------------------------
   ;THIS SECTION PRINTS A MESSAGE
   mov eax, (green+16*black)
   call settextcolor
   mov edx, offset msg1
   call writestring
   call crlf
   mov edx, offset blank
   mov eax, (white+16*black)    ; set the text color back to white
   call settextcolor
   ;END OF MESSAGE PRINTING
   ;------------------------------
  
   mov esi, offset array
   mov ecx, 100
   L2:                   ;reads the array and prints out values
	mov ebx, [esi]
	mov eax, ebx
	call writeInt
	call writestring
	add esi, 4
   
   loop L2
   ;---------------------------------
   
   ;THIS SECTION CREATES LINE BREAKS AND PRINTS A MESSAGE
   ;
   mov eax, (red+16*black)
   call settextcolor
   
   call crlf                    ;carriage return then, prints a line
   mov edx, offset line
   call writestring
   call crlf
   
   mov eax, (green+16*black)
   call settextcolor
   
   mov edx, offset msg2
   call writestring
   call crlf
   
   mov eax, (white+16*black)    ; set the text color back to white
   call settextcolor
   ;END OF MESSAGE PRINTING
   ;------------------------------------------------------------------
   
   
   
   ;PART B: PRINTING THE ARRAY BACKWARDS
   ;-------------prints array backwards
   
   mov ecx, 100
   mov esi, offset array
   
   L3:    ; pushes array values into esi
   push esi
   add esi, 4
   loop L3
   
   mov edx, offset blank
   mov ecx, 100
   L4:        ; pops values out and prints resulting in the array printing backwards
	pop esi
	mov ebx, [esi]
	mov eax, ebx
	call writeInt
	call writestring
   loop L4
   ;END OF PART B
   ;----------------------------------
   
   
   
   
    ;THIS SECTION CREATES LINE BREAKS AND PRINTS A MESSAGE
   ;
   mov eax, (red+16*black)
   call settextcolor
   
   call crlf                    ;carriage return then, prints a line
   mov edx, offset line
   call writestring
   call crlf
   
   mov eax, (green+16*black)
   call settextcolor
   
   mov edx, offset msg3
   call writestring
   call crlf
   
   mov eax, (white+16*black)    ; set the text color back to white
   call settextcolor
   
   mov edx, offset blank
   ;END OF MESSAGE PRINTING
   ;------------------------------------------------------------------
   
   
  
   
   ;-----------------------------------
   ;PART C: COPY TO ARRAY CALLED TARGET AND PRINT THAT OUT
   
   mov ecx, 100
   mov edi, 0
   mov esi, offset array
   L5:
   mov ebx, [esi]
   mov target[edi], ebx
   add esi, 4
   add edi, 4
   loop L5
   
   mov esi, offset target
   mov ecx, 100
   L6:                   ;reads the array and prints out values
	mov ebx, [esi]
	mov eax, ebx
	call writeInt
	call writestring
	add esi, 4
   loop L6
  
exit
	main ENDP
			; (insert additional procedures here)


END main
