.globl playerMove
.type playerMove, @function

.section .text

.equ LOCAL_ROW, -8
.equ LOCAL_COL, -16

playerMove:
    enter $16, $0

retry:
    movq    stdout@GOTPCREL(%rip), %rdi
    movq    (%rdi), %rdi
    leaq    row_prompt(%rip), %rsi
    xor     %rax, %rax
    call    fprintf@PLT

    movq    stdin@GOTPCREL(%rip), %rdi
    movq    (%rdi), %rdi
    leaq    scanf_format(%rip), %rsi
    leaq    LOCAL_ROW(%rbp), %rdx
    xor     %rax, %rax
    call    fscanf@PLT
    decq    LOCAL_ROW(%rbp)


    # Get column input
    movq    stdout@GOTPCREL(%rip), %rdi
    movq    (%rdi), %rdi
    leaq    col_prompt(%rip), %rsi
    xor     %rax, %rax
    call    fprintf@PLT

    movq    stdin@GOTPCREL(%rip), %rdi
    movq    (%rdi), %rdi
    leaq    scanf_format(%rip), %rsi
    leaq    LOCAL_COL(%rbp), %rdx
    xor     %rax, %rax
    call    fscanf@PLT
    decq    LOCAL_COL(%rbp)

    # Validate input
    movq    LOCAL_ROW(%rbp), %rax
    cmpq    $0, %rax
    jl      invalid
    cmpq    $2, %rax
    jg      invalid
    movq    LOCAL_COL(%rbp), %rax
    cmpq    $0, %rax
    jl      invalid
    cmpq    $2, %rax
    jg      invalid

    # Check if spot is empty
    movq    LOCAL_ROW(%rbp), %rax
    imulq   $3, %rax, %rax
    addq    LOCAL_COL(%rbp), %rax
    leaq    board(%rip), %rcx
    cmpb    $' ', (%rcx,%rax)
    jne     invalid

    # Place player marker
    movb    $PLAYER, (%rcx,%rax)
    jmp     valid

invalid:
    movq    stdout@GOTPCREL(%rip), %rdi
    movq    (%rdi), %rdi
    leaq    invalid_msg(%rip), %rsi
    xor     %rax, %rax
    call    fprintf@PLT
    jmp     retry

valid:
    leave
    ret
