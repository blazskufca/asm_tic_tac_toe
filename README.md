#  Tic-tac-toe in Assembly

A simple game of Tic-tac-toe in [x86_64 ISA](https://en.wikipedia.org/wiki/X86-64) assembly ([AT&T syntax](https://en.wikipedia.org/wiki/X86_assembly_language#Syntax) and [GAS](https://en.wikipedia.org/wiki/GNU_Assembler)).

![image](https://github.com/user-attachments/assets/2333b646-2a7d-4985-a1d5-d0ffda9d8420)

## A couple of important notes

1. Despite being in assembly, it still relies on [libc](https://en.wikipedia.org/wiki/C_standard_library).

2. This is primarily a learning project. It does not prioritize optimization, binary size, or performance efficiency. In fact, its performance and size are likely worse than output from any semi-optimized compiler

## Run Locally

1. Clone the project

2. `cd` into the repo directory

3. Compile:
    - Either as static executable: `gcc -static *.s -o tictactoe`
    - Or dynamic executable: `gcc -rdynamic *.s -o tictactoe`

4. Play a couple of rounds of Tic-Tac-tictactoe: `./tictactoe`
## Acknowledgements

 - [Learn to Program with Assembly: Foundational Learning for New Programmers by Jonathan Bartlett](https://www.amazon.com/Learn-Program-Assembly-Foundational-Programmers/dp/1484274369)
