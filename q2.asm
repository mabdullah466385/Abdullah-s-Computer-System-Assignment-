.model small
.stack 100h

.data
     myArr db 8,16,24,32
     
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov al, myArr[1]
    
    mov bl, 4
    mul bl
    
    mov cl, 8
    div cl
    
    mov myArr[1], al
    
    mov ah, 4ch
    int 21h
    
main endp
end main