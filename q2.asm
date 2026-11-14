.model small                ; set small memory model
.stack 100h                 ; allocate 256 bytes for stack

.data
     myArr db 8,16,24,32    ; initialized byte array
     msg db 'Result: $'     ; initialized string to display before answer
     
.code
main proc
    mov ax, @data
    mov ds, ax              ; initialize data segment
    
    mov al, myArr[1]        ; load 2nd element (16) into AL
    
    mov bl, 4
    mul bl                  ; multiply 16 by 4 (AX = 64)
    
    mov cl, 8
    div cl                  ; divide 64 by 8 (AL = 8)
    
    mov myArr[1], al        ; store updated value back in array
    
    lea dx, msg             
    mov ah, 09h
    int 21h                 ; print 'Result: ' on screen
    
    mov dl, al              
    add dl, '0'             ; convert digit to ASCII character
    mov ah, 02h
    int 21h                 ; print final answer (8)
    
    mov ah, 4ch
    int 21h                 ; exit to DOS
    
main endp
end main