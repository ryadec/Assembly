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
star byte '*',0
x byte 0
y byte 0        
.code
main PROC	; (insert executable instructions here)
     

	 call blueline
	 call redline
     call greenline
	 call yellowline
	
	 mov dh, 22
     call gotoxy	 

       
 
exit
;---------------------BLUE LINE
blueline proc
;2,10   to 2,1
   call clrscr
   mov eax, (blue+16*black)    ; set the text color back to white
   call settextcolor
	    mov edx, 0
		mov x, 2
		mov y, 10
		
		
		mov ecx, 9
		L2:
		mov dl, x
		mov dh, y
		push edx 
			call gotoxy
			mov edx, offset star
			mov eax, 50
			call delay
			call writestring
		pop edx
		dec y
		
		loop L2



   mov eax, (white+16*black)    ; set the text color back to white
   call settextcolor
ret
blueline endp
;---------------------RED LINE
redline proc
;2,1 to 10,1
	   
	   mov eax, (red+16*black)    ; set the text color back to white
	   call settextcolor
		mov dl, 2
		mov dh, 1
		call gotoxy
		
		mov ecx, 8
		L1:
		mov edx, offset star
		mov eax, 50
		call delay
		call writestring
		inc dl
		loop L1
	   
	   mov eax, (white+16*black)    ; set the text color back to white
       call settextcolor
ret
redline endp
;--------------------GREEN LINE
greenline proc
;10,1 to 10,10
        mov eax, (green+16*black)    ; set the text color back to white
        call settextcolor

		
		mov x, 10
		mov y, 1
		
		
		mov ecx, 9
		L3:
		mov dl, x
		mov dh, y
		call gotoxy
		mov edx, offset star
		mov eax, 50
		call delay
		call writestring
		inc y
		
		loop L3
		

		
		mov eax, (white+16*black)    ; set the text color back to white
        call settextcolor
		
ret
greenline endp
;-------------------- YELLOWLINE
yellowline proc
;10,10 to 2,10
		   mov eax, (yellow+16*black)    ; set the text color back to white
           call settextcolor

		mov x, 10
		mov y, 10
		
		
		mov ecx, 8
		L4:
		mov dl, x
		mov dh, y
		call gotoxy
		mov edx, offset star
		mov eax, 50
		call delay
		call writestring
		dec x
		
		loop L4
		   
		   	   
	   mov eax, (white+16*black)    ; set the text color back to white
           call settextcolor
ret
yellowline endp

	main ENDP
			; (insert additional procedures here)


END main
