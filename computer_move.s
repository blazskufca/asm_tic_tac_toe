.globl computerMove
.type computerMove, @function
.section .text

.equ LOCAL_ROW, -8
.equ LOCAL_COL, -16

computerMove:
    enter $16, $0
    # Seed RNG
    xorq    %rdi, %rdi
    call    time@PLT
    movq    %rax, %rdi
    call    srand@PLT

find_spot:
    call    rand@PLT
    xor     %rdx, %rdx
    movq    $3, %rcx
    divq    %rcx
    movq    %rdx, LOCAL_ROW(%rbp)

    call    rand@PLT
    xor     %rdx, %rdx
    movq    $3, %rcx
    divq    %rcx
    movq    %rdx, LOCAL_COL(%rbp)

    # Check if spot is empty
    movq    LOCAL_ROW(%rbp), %rax
    imulq   $3, %rax
    addq    LOCAL_COL(%rbp), %rax
    leaq    board(%rip), %rcx
    cmpb    $' ', (%rcx,%rax)
    jne     find_spot

    movb    $COMPUTER, (%rcx,%rax)

exit:
    leave
    ret
