;boot loader
org 0x7c00
bits 16
start: jmp boot

;;constants and variables definitions
msg db "Welcome to dush OS!", 0ah, 0dh, 0h

boot:
    cli; no interupts
    cld; initializing the cli
    hlt; Halt the system/ stop the CPU

times 510 - ($-$$) db 0
dw 0xAA55 ; Boot signature [the BIOS looks for a 16-bit value of 0xAA55 at the end of the boot sector]