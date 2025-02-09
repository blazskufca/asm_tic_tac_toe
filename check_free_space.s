.globl checkFreeSpaces
.type checkFreeSpaces, @function
.section .text

checkFreeSpaces:
    enter   $0, $0
    leaq    board(%rip), %rcx
    movq    $9, %rax
    movq    $0, %rdx

free_loop:
    cmpb    $' ', (%rcx,%rdx)
    je      skip_dec
    decq    %rax

skip_dec:
    incq    %rdx
    cmpq    $9, %rdx
    jl      free_loop

exit:
    leave
    ret
    