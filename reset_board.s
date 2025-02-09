.globl resetBoard
.type resetBoard, @function

# Reset board takes care of clearing all the fields of the board
# Placeholder char is ' '

.section .text

resetBoard:
    enter $0, $0
    leaq    board(%rip), %rdi
    movq    $9, %rcx
    movb    $' ', %al

reset_loop:
    movb    %al, (%rdi)
    incq    %rdi
    loop    reset_loop

exit:
    leave
    ret
