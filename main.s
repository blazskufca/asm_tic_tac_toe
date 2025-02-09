.section .text

.globl main

.equ LCL_PLAYER, -1 # Just a byte (i.e player char)
.equ LCL_ANOTHER_ROUND, -2

main:
        enter $16, $0
        
        # Clear the screen
        movq    stdout@GOTPCREL(%rip), %rdi
        movq    (%rdi), %rdi
        leaq    ANSI_CLEAR_SCREEN(%rip), %rsi
        xor     %rax, %rax 
        call    fprintf@PLT

        movq    stdout@GOTPCREL(%rip), %rdi
        movq    (%rdi), %rdi
        leaq    ANSI_CURSOR_UP(%rip), %rsi
        xor     %rax, %rax 
        call    fprintf@PLT

        # Print welcome message
        movq    stdout@GOTPCREL(%rip), %rdi
        movq    (%rdi), %rdi
        leaq    welcome_msg(%rip), %rsi
        xor     %rax, %rax
        call    fprintf@PLT

init:
        # Initialize game
        call    resetBoard
        movb    $' ', LCL_PLAYER(%rbp)

game_loop:
        # Check game state
        movzbq  -1(%rbp), %rax
        cmpq   $' ', %rax
        jne     game_over
        call    checkFreeSpaces
        testq   %rax, %rax
        je      game_over

        call    printBoard
        call    playerMove
        call    checkWinner
        movb    %al, LCL_PLAYER(%rbp)

        cmpb    $' ', %al
        jne     game_over
        call    checkFreeSpaces
        testq   %rax, %rax
        je      game_over

        call    computerMove
        call    checkWinner
        movb    %al, LCL_PLAYER(%rbp)

        jmp     game_loop

game_over:
        call    printBoard
        movzbq  LCL_PLAYER(%rbp), %rdi
        call    printWinner

        movq    stdout@GOTPCREL(%rip), %rdi
        movq    (%rdi), %rdi
        leaq    play_another_game_prompt(%rip), %rsi
        xor     %rax, %rax 
        call    fprintf@PLT

        movq    stdin@GOTPCREL(%rip), %rdi
        movq    (%rdi), %rdi
        leaq    play_another_game_format, %rsi
        leaq    LCL_ANOTHER_ROUND(%rbp), %rdx
        call    fscanf@PLT

        cmpb    $'Y', LCL_ANOTHER_ROUND(%rbp)
        je      clear_screen
        cmpb    $'y', LCL_ANOTHER_ROUND(%rbp)
        je      clear_screen
        jmp     exit

clear_screen:
        movq    stdout@GOTPCREL(%rip), %rdi
        movq    (%rdi), %rdi
        leaq    ANSI_CLEAR_SCREEN(%rip), %rsi
        xor     %rax, %rax 
        call    fprintf@PLT

        movq    stdout@GOTPCREL(%rip), %rdi
        movq    (%rdi), %rdi
        leaq    ANSI_CURSOR_UP(%rip), %rsi
        xor     %rax, %rax 
        call    fprintf@PLT
        jmp init

exit:
        xor     %rax, %rax
        leave
        ret
