TITLE printing multiline          (mline.asm)
  
INCLUDE Irvine32.inc

.data  
 array1 byte 3,' ',1,'O',1,' ',2,'O',4,' ',3,'O' 
 array2 byte 3,' ',2,'O',2,' ',1,'O',2,' ',1,'O',3,' ',1,'O'
 array3 byte 3,' ',1,'O',6,' ',1,'O',3,' ',1,'O'
 array4 byte 3,' ',1,'O',6,' ',1,'O',3,' ',1,'O'
 array5 byte 3,' ',1,'O',7,' ',3,'O'
 ;------------------------------
 ;---OOOOO  
 ;---O-----O-OO
 ;---OOO---OO--O
 ;---O-----O
 ;---O-----O 
 ;  PLOT OF WHAT WE ARE GOING TO PRINT         
 ;------------------------------
 ;  
 ;---O-OO----OOO       *
 ;---OO--O--O---O      *
 ;---O------O---O      *
 ;---O------O---O      *
 ;---0-------OOO       *
 
 delta dword ?
 l dword ?
 lenarray1 = lengthof array1
 lenarray2 = lengthof array2
 lenarray3 = lengthof array3
 lenarray4 = lengthof array4
 lenarray5 = lengthof array5
 grandarray dword 10 dup(?)    ;2x number of arrays 
 ; grandarray contains the the three offsets and the 3 lengths of the arrays
 .code
main proc
	
	call clrscr
 	mov eax, (red+16*black)
    call settextcolor
 
	mov dh,10
	mov dl,5   
	call gotoxy   ;line will start at 10 down 5 across
  
 
	call fill         			 ; fill grandarray
	call picture     		     ; draw the picture
  	mov eax, (white+16*black)    ; set the text color back to white
    call settextcolor
   
  
   exit  
     
main ENDP
drawline proc
     
    lineloop:    
       call writechar
       inc dl
    loop lineloop
    ret
 drawline endp
 
fill proc
; dword array will be of the form 
; off len off len off len
  mov esi,offset grandarray
  mov [esi],offset array1
  add esi,4
  
  mov ebx, lenarray1/2
  mov [esi],ebx
  add esi,4
  
  mov [esi],  offset array2
  add esi,4
  
  mov ebx, lenarray2/2
  mov [esi],ebx
  add esi,4
  
  mov [esi],   offset array3
  add esi,4
  
  mov ebx, lenarray3/2
  mov [esi],ebx
  add esi,4
  
  
  mov [esi], offset array4
  add esi,4
 
  mov ebx, lenarray4/2
  mov [esi],ebx
  add esi,4 
 
  mov [esi], offset array5
  add esi,4
  
  mov ebx, lenarray5/2
  mov [esi],ebx
  ret
fill endp

picture proc

 mov esi,offset grandarray
 sub esi,4   ; we start a dword back
 mov ecx, 5
 ;-------------------------------------------OUTER LOOP
		outer:
		push ecx
   ; get each array from grandarry data
		add esi,4
		mov edi, [esi]
		add esi, 4
		mov ecx, [esi]
		mov l,ecx
		mov ecx, l
		;-------------------------------------INNER LOOP
				inner:
					push ecx     ;use data from eachg line to det up  
					mov ecx,0
					mov   cl, [edi]
      
					inc edi
					mov al,[edi]
					call drawline
					inc edi
      
					pop ecx
				loop inner
		;------------------------------------END INNER LOOP	
		inc dh 
		mov dl,5
		pop ecx
		call gotoxy
		  ;call dumpregs
		; call waitmsg
		loop outer
		;--------------------------------------------END OUTER LOOP
		ret
picture endp
 END main