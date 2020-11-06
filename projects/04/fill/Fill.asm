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

// Put your code here.
(MAINLOOP)

@KBD
D=M
@RENDERBLACK
D;JNE

//Init counter to 16384
@16384
D=A
@counter
M=D

(WHITELOOP)
//save "white" into D
@-1
D=A
@counter
//put the value of memory@counter into A
A=M
//color that -1 (which is black)
M=D
@counter
//save the counter as counter + 1
MD=M+1
//check if counter - maxvalue is smaller than 0
@24576
D=A-D
@WHITELOOP
D;JEQ
@MAINLOOP
0;JMP

(RENDERBLACK)
@16384
D=A
@counter
M=D

(BLACKLOOP)
//save "black" into D
@-1
D=A
@counter
//put the value of memory@counter into A
A=M
//color that -1 (which is black)
M=D
@counter
//save the counter as counter + 1
MD=M+1
//check if counter - maxvalue is smaller than 0
@24576
D=A-D
@BLACKLOOP
D;JEQ
@MAINLOOP
0;JMP
