.globl printWinner
.type printWinner, @function

.section .text

printWinner:
    enter   $0, $0
    cmpb    $PLAYER, %dil
    je      player
    cmpb    $COMPUTER, %dil
    je      computer
    leaq    tie_msg(%rip), %rsi
    jmp     print

player:
    leaq    player_wins_msg(%rip), %rsi
    jmp     print

computer:
    leaq    computer_wins_msg(%rip), %rsi

print:
    movq    stdout@GOTPCREL(%rip), %rdi
    movq    (%rdi), %rdi
    xor     %rax, %rax
    call    fprintf@PLT

exit:
    leave
    ret
