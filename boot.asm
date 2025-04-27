; Simple Hello World OS (boot sector)

BITS 16
ORG 0x7C00

start:
    ; Set video mode to 80x25 text mode
    mov ax, 0x03
    int 0x10

    ; Set the pointer to the video memory
    mov si, hello_message

print_loop:
    lodsb                ; Load next character from DS:SI into AL
    cmp al, 0
    je done              ; If character is 0 (null terminator), end
    mov ah, 0x0E         ; BIOS teletype output
    int 0x10
    jmp print_loop

done:
    cli                  ; Clear interrupts
    hlt                  ; Halt the CPU

hello_message db 'Hello World!', 0

times 510-($-$$) db 0    ; Fill the rest of the sector with zeros
dw 0xAA55                ; Boot signature
