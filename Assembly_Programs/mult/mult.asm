// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

//Setting data register to hold value of R0
@R0
D=M

//Setting counter variable at i register to hold value of R0
@i
M=D-1

@R1
D=M

//Storing value of 0 into R2 register to begin iterative addition process of multiplication
@R2
M=0

(LOOP)
  @R2
  M=M+D

//Checking if the i counter variable has reached 0 or not
  @i
  M;JLE
  M=M-1


//If i counter has not reached 0, then continue loop
@LOOP
0;JMP

//Program termination
(i)

(ILOOP)
  @ILOOP
  0;JMP
