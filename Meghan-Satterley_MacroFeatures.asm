;Meghan Satterley
;Spring 2022
;This program implements macro definition and use

TITLE Macro Features      (Meghan-Satterley_MacroFeatures.asm)

INCLUDE Irvine32.inc

mPrintChr MACRO chr,cnt  ;macro to print a character
    LOCAL Next
    push eax
    push ecx
    call Crlf
    mov ecx,cnt
    mov al,chr
Next:
    call WriteChar
    loop Next

    call Crlf
    pop ecx
    pop eax
ENDM

mWriteLine MACRO str  ;macro to print a string
    LOCAL buffer
    .data
    buffer BYTE str,0
    .code
    push edx
    mov edx,OFFSET buffer
    call WriteString
    call Crlf
    mov eax,LENGTHOF buffer
    dec eax
    pop edx
ENDM

.data
stringMsg BYTE "This is a null-terminated string",0

.code
main PROC			;calling macros to print messages
    call Crlf
    call Crlf

    mPrintChr '-',32
    mWriteLine "This is a string literal"
    mWriteLine "Here is another string"
    mWriteLine "And yet another string"
    mPrintChr '_',eax

    call    Crlf
    call    Crlf
    call    WaitMsg

    exit
main ENDP

END main