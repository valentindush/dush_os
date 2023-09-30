; io.asm - I/O Library

section .text
global MovCursor, PutChar, Print

; MovCursor: Move the cursor to a specific location
; Input:  bh = Y coordinate, bl = X coordinate
; Output: None
MovCursor:
    pusha
    mov ah, 2       ; Video BIOS function to set cursor position
    mov bh, 0       ; Page number (we're using the default page)
    mov dl, bl      ; Column (X coordinate)
    mov dh, bh      ; Row (Y coordinate)
    int 10h         ; Call BIOS interrupt to set the cursor
    popa
    ret

; PutChar: Print a character on screen at the cursor position
; Input:  al = Character to print, bl = Text color, cx = Number of times to print the character
; Output: None
PutChar:
    pusha
    mov ah, 0x0E    ; Video BIOS function to write a character with attribute
    mov bh, 0       ; Page number
    mov bl, bl      ; Text color
    mov cx, 1       ; Set to 1 character to be printed
    int 10h         ; Call BIOS interrupt to write character
    popa
    ret

; Print: Print a zero-terminated string
; Input:  ds:si = Pointer to the string
; Output: None
Print:
    pusha
.loop:
    lodsb           ; Load the next character from ds:si into al and increment si
    test al, al     ; Check if it's the null terminator
    jz .done        ; If null terminator, we're done
    call PutChar    ; Call PutChar to print the character
    jmp .loop
.done:
    popa
    ret
