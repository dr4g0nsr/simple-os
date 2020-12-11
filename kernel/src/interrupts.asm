[EXTERN _int0xUnknown_handler]
[EXTERN _int0x80_handler]
[EXTERN _int0x20_handler]
[EXTERN _int0x21_handler]
[EXTERN _int0x8_handler]
[EXTERN _int0xB_handler]
[EXTERN _int0xC_handler]
[EXTERN _int0xD_handler]
[EXTERN _int0xE_handler]
[EXTERN _int0xF_handler]

[GLOBAL _isr0xUnknown]
_isr0xUnknown:
    cli  
    pusha
    mov ax, 0x10 ;data segment
    mov ds, ax
    mov es, ax
    mov gs, ax
    mov fs, ax
    mov ss, ax
    
    call _int0xUnknown_handler
    
    mov eax, 0x10
    mov ss, ax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    popa
iret 

[GLOBAL _isr0x80]
_isr0x80:
    cli  
    pusha
    mov ax, 0x10 ;data segment
    mov ds, ax
    mov es, ax
    mov gs, ax
    mov fs, ax
    mov ss, ax
    
    call _int0x80_handler
    
    mov eax, 0x10
    mov ss, ax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    popa
    sti
iret 

[GLOBAL _isr0x20]
_isr0x20:
    cli   
    pusha
    mov ax, ds
    mov ax, 0x10 ;data segment
    mov ds, ax
    mov es, ax
    mov gs, ax
    mov fs, ax
    mov ss, ax
    
    call _int0x20_handler
    
    mov eax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    popa
    sti
iret 

[GLOBAL _isr0x21]
_isr0x21:
    cli   
    pusha
    mov ax, ds
    mov ax, 0x10 ;data segment
    mov ds, ax
    mov es, ax
    mov gs, ax
    mov fs, ax
    mov ss, ax
    
    call _int0x21_handler
    
    mov eax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    popa
    sti
iret 

[GLOBAL _isr0x8] ;double fault
_isr0x8: 
    cli
    pusha
    mov ax, ds
    push eax
    mov ax, 0x10 ;data segment
    mov ds, ax
    mov es, ax
    mov gs, ax
    mov fs, ax
    mov ss, ax
    
    call _int0x8_handler
    
    pop eax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    popa
    sti
iret 

[GLOBAL _isr0xB] ;segment not present, pushes error code
_isr0xB: 
    cli
    pusha
    mov ax, 0x10 ;data segment
    mov ds, ax
    mov es, ax
    mov gs, ax
    mov fs, ax
    mov ss, ax
    
    call _int0xB_handler
    
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    popa
    sti
iret 

[GLOBAL _isr0xC] ;stack fault
_isr0xC: 
    cli
    pusha
    mov ax, ds
    push eax
    mov ax, 0x10 ;data segment
    mov ds, ax
    mov es, ax
    mov gs, ax
    mov fs, ax
    mov ss, ax
    
    call _int0xC_handler
    
    pop eax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    popa
    sti
iret 

[GLOBAL _isr0xD] ;general protection fault
_isr0xD: 
    cli
    pusha
    mov ax, ds
    push eax
    mov ax, 0x10 ;data segment
    mov ds, ax
    mov es, ax
    mov gs, ax
    mov fs, ax
    mov ss, ax
    
    call _int0xD_handler
    
    pop eax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    popa
    sti
iret 

[GLOBAL _isr0xE] ;page fault, pushes error code
_isr0xE: 
    cli
    mov ebp, esp
    pusha
    mov ax, ds
    push eax
    mov ax, 0x10 ;data segment
    mov ds, ax
    mov es, ax
    mov gs, ax
    mov fs, ax
    mov ss, ax
    
    mov eax, cr2
    push eax
    call _int0xE_handler
    
    
    pop eax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    popa
    sti
iret 

[GLOBAL _isr0xF] ;unknown interrupt
_isr0xF: 
    cli
    pusha
    mov ax, ds
    push eax
    mov ax, 0x10 ;data segment
    mov ds, ax
    mov es, ax
    mov gs, ax
    mov fs, ax
    mov ss, ax
    
    call _int0xF_handler
    
    pop eax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    popa
    sti
iret 