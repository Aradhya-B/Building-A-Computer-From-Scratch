// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(LOOP) //Original loop
  @8192 //32 words per row times 256 rows
  D=A
  @i //Setting i as the check variable counter
  M=D

  @SCREEN
  D=A
  @arr //Setting arr as the first register in memory that affects the screen
  M=D

  @n //Setting n as the variable counter
  M=0

  @KBD //Checking if the keyboard is pressed or not - if pressed go to black
  D=M
  @WHITE
  D;JEQ
  @BLACK
  0;JMP

(WHITE)
  //Checking if i == n, if they are equal, jump to beginning of loop (Drawing is done)
   @i
   D=M
   @n
   D=D-M
   @LOOP
   D;JEQ

//Setting the value of a screen register offset from the first screen register by n
   @arr
   D=M
   @n
   A=D+M
   M=0

//Incrementing the value of n for loop
   @n
   M=M+1

//If this stage has been reached, then the WHITE loop is incomplete (All the registers have not been written to)
   @WHITE
   0;JMP

(BLACK)
    @i
    D=M
    @n
    D=D-M
    @LOOP
    D;JEQ

    @arr
    D=M
    @n
    A=D+M
    M=-1 //1111111111111111

    @n
    M=M+1

  @BLACK
  0;JMP
