.globl printBoard
.type printBoard, @function

# Print board prints all the fields of the board, as the name suggests
.section .text

printBoard:
        enter $0, $0
        pushq   $0
        pushq   %rbx
        leaq    board(%rip), %rbx

        # Print first row
        movq    stdout@GOTPCREL(%rip), %rdi
        movq    (%rdi), %rdi
        leaq    format_row(%rip), %rsi
        movq    (%rbx), %rdx
        movq    1(%rbx), %rcx
        movq    2(%rbx), %r8
        xor     %rax, %rax
        call    fprintf@PLT

        movq    stdout@GOTPCREL(%rip), %rdi
        movq    (%rdi), %rdi
        leaq    format_sep(%rip), %rsi
        xor     %rax, %rax
        call    fprintf@PLT

        # Print second row
        movq    stdout@GOTPCREL(%rip), %rdi
        movq    (%rdi), %rdi
        leaq    format_row(%rip), %rsi
        movq    3(%rbx), %rdx
        movq    4(%rbx), %rcx
        movq    5(%rbx), %r8
        xor     %rax, %rax
        call    fprintf@PLT

        movq    stdout@GOTPCREL(%rip), %rdi
        movq    (%rdi), %rdi
        leaq    format_sep(%rip), %rsi
        xor     %rax, %rax
        call    fprintf@PLT

        # Print third row
        movq    stdout@GOTPCREL(%rip), %rdi
        movq    (%rdi), %rdi
        leaq    format_row(%rip), %rsi
        movq    6(%rbx), %rdx
        movq    7(%rbx), %rcx
        movq    8(%rbx), %r8
        xor     %rax, %rax
        call    fprintf@PLT

        movq    stdout@GOTPCREL(%rip), %rdi
        movq    (%rdi), %rdi
        leaq    format_sep(%rip), %rsi
        xor     %rax, %rax
        call    fprintf@PLT
exit:
    popq %rbx
    leave
    ret
    