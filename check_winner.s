.globl checkWinner
.type checkWinner, @function
.section .text

checkWinner:
    enter   $0, $0
    leaq    board(%rip), %rcx
    movq    $0, %rdx

row_loop:
    movq    %rdx, %rax
    imulq   $3, %rax
    movzbq  (%rcx,%rax), %r8
    movzbq  1(%rcx,%rax), %r9
    movzbq  2(%rcx,%rax), %r10

    cmpq    %r8, %r9
    jne     next_row
    cmpq    %r8, %r10
    jne     next_row
    cmpb    $' ', %r8b
    je      next_row
    movq    %r8, %rax
    jmp     done

next_row:
    incq    %rdx
    cmpq    $3, %rdx
    jl      row_loop

    # Check columns
    movq    $0, %rdx

col_loop:
    movzbl  (%rcx,%rdx), %r8d
    movzbl  3(%rcx,%rdx), %r9d
    movzbl  6(%rcx,%rdx), %r10d
    cmpq    %r8, %r9
    jne     next_col
    cmpq    %r8, %r10
    jne     next_col
    cmpb    $' ', %r8b
    je      next_col
    movq    %r8, %rax
    jmp     done

next_col:
    incq    %rdx
    cmpq    $3, %rdx
    jl      col_loop

    # Check diagonals
    movzbq  (%rcx), %r8
    movzbq  4(%rcx), %r9
    movzbq  8(%rcx), %r10

    cmpq    %r8, %r9
    jne     second_diag
    cmpq    %r8, %r10
    jne     second_diag
    cmpb    $' ', %r8b
    je      second_diag
    movq    %r8, %rax
    jmp     done

second_diag:
    movzbq  2(%rcx), %r8
    movzbq  4(%rcx), %r9
    movzbq  6(%rcx), %r10

    cmpq    %r8, %r9
    jne     no_win
    cmpq    %r8, %r10
    jne     no_win
    cmpb    $' ', %r8b
    je      no_win
    movq    %r8, %rax
    jmp     done

no_win:
    movq    $' ', %rax

done:
    leave
    ret
    