.globl welcome_msg, instructions_msg, format_row, format_sep, newline, row_prompt, col_prompt, invalid_msg, scanf_format
.globl player_wins_msg, computer_wins_msg, tie_msg, board, PLAYER, COMPUTER, play_another_game_prompt, play_another_game_format
.globl ANSI_CLEAR_SCREEN, ANSI_CURSOR_UP

.type welcome_msg, @object
.type instructions_msg, @object
.type format_row, @object
.type format_sep, @object
.type newline, @object
.type row_prompt, @object
.type col_prompt, @object
.type invalid_msg, @object
.type scanf_format, @object
.type player_wins_msg, @object
.type computer_wins_msg, @object
.type tie_msg, @object
.type board, @object
.type PLAYER, @object
.type COMPUTER, @object
.type play_another_game_prompt, @object
.type play_another_game_format, @object
.type ANSI_CLEAR_SCREEN, @object
.type ANSI_CURSOR_UP, @object

.section .rodata

welcome_msg:
    .string "****************************************************\n         Welcome to the Tic Tac Toe game!           \n****************************************************\n\n* Instructions \n\n\tPlayer 1 sign = X\n\tPlayer 2 sign = O\n\n"

instructions_msg:
    .string ""

format_row:
    .string " %c | %c | %c \n"

format_sep:
    .string "---|---|---\n"

newline:
    .string "\n"

row_prompt:
    .string "Enter row #(1-3): "

col_prompt:
    .string "Enter column #(1-3): "

invalid_msg:
    .string "Invalid move! Try again!\n\n"

scanf_format:
    .string "%d"

player_wins_msg:
    .string "\n\t --- Game Over --- \n  *** Congratulations, You won!! ***\n:: Thanks for playing Tic Tac Toe game! :: \n"

computer_wins_msg:
    .string "\n\t --- Game Over --- \n  *** Sorry, you lost. Better luck next time! ***\n:: Thanks for playing Tic Tac Toe game! :: \n"

tie_msg:
    .string "\n\t --- Game Over --- \n  *** It's a tie! ***\n:: Thanks for playing Tic Tac Toe game! :: \n"

play_another_game_prompt:
    .string "Do you wish to play another round? (y/n)\n"

play_another_game_format:
    .string " %c"

ANSI_CLEAR_SCREEN:
    .string "\033[2J"

ANSI_CURSOR_UP:
    .string "\033[H"

.section .bss
.comm board, 9     # 3x3 game board

.equ PLAYER, 'X'
.equ COMPUTER, 'O'
