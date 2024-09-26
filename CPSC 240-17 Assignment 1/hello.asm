;****************************************************************************************************************************

;Program name: “Hello Program” takes string input from user and outputs to welcome the user. *

 

;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *

;version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will be useful,   *

;but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See   *

;the GNU General Public License for more details A copy of the GNU General Public License v3 is available here:             *

;<https://www.gnu.org/licenses/>.       

 

;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**

;Author information

;  Author name: Ahad Ahmad

;  Author email: ahadahmad@csu.fullerton.edu

; CWID: 886864362

; Class: CPSC 240 

;

;Program information

;  Program name: Hello Program

;  Programming languages: C++, x86 bash

;  Date program began: 2024-Aug-24

;  Date of last update: 2024-Sept-24

;  Files in this program: welcome.cpp, hello.asm, r.sh.

;  Testing: Alpha testing is complete and all functions are correct

;  Status: Ready for release to customers

;

;Purpose

;  This program inputs string variables from user and outputs message. Welcoming the user.

;

;This file:

;  File name: hello.asm

;  Language: X86-64

;  Assemble (standard): nasm -f elf64 -l hello.lis -o hello.o hello.asm

;  Assemble (debug): nasm -f elf64 -g dwarf -l hello.lis -o hello.o hello.asm

;  Optimal print specification: Landscape, 7 points, monospace, 8½x11 paper

;  Prototype of this function: hello();

 

;

;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**




extern printf                                               

extern scanf                                                

extern fgets                                              

extern stdin                                               

extern strlen                                               

global hello                                          

nameUser_string equ 48                                        
titleUser_string equ 48
day_string equ 48
salary_string equ 48

three_point_five equ 0x400C000000000000

segment .data                                               

align 16


;declarations
firstMessage db "Please enter your first and last name: ", 0


;new
titleMessage db  "Please enter your title (Ms.Mr, Engineer, Progammer, Mathmetician, Genius, etc):" ,0


welcomeMessage db "Hello %s %s, How has your day been so far? ", 0                                    ;general string format

isReallyNice db " %s is really nice ", 10, 0

salaryFromUser db "What is your salary in dollars: ", 0

salaryOutputMessage db "Oh. $%s is very nice too for a programmer.", 10, 0

conclusionMessage db "This concludes the demonstration of the Hello program written in x86 assembly.", 10, 0

align 64                                                    ;Insure that the next data declaration starts on a 64-byte boundary.


segment .bss                                                ;Declare pointers to un-initialized space in this segment.

;storing into resb
userName resb nameUser_string
nameTitle resb titleUser_string
dayValue resb day_string
userSalary resb salary_string


segment .text                                               ;Place executable instructions in this segment.

hello:                                                ;Entry point.  Execution begins here.

;Backing up GPRs
push rbp
mov rbp, rsp
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
pushf


;Output for firstMessage
mov qword	rax, 0
mov		rdi, firstMessage
call printf

;input from user
mov 		rax, 0
mov 		rdi, userName
mov		rsi, nameUser_string
mov		rdx, [stdin]
call		fgets
		

;remove linebreak
mov		rax,0
mov		rdi, userName
call		strlen
mov		[userName + rax - 1], byte 0

;title Output
mov qword	rax, 0
mov		rdi, titleMessage
call printf

;Input from user for title
mov             rax, 0
mov             rdi, nameTitle
mov             rsi, titleUser_string
mov             rdx, [stdin]
call            fgets

;Remove linebreak
mov             rax,0
mov             rdi, nameTitle
call            strlen
mov             [nameTitle + rax - 1], byte 0

;storing nameTitle and userName for the string variables from declaration and also welcome message
mov qword	rax, 0
mov		rdi, welcomeMessage
mov		rsi, nameTitle
mov		rdx, userName
call printf

;output to user asking for how day is going
mov             rax, 0
mov             rdi, dayValue
mov             rsi, day_string
mov             rdx, [stdin]
call            fgets

;Remove line
mov             rax,0
mov             rdi, dayValue
call            strlen
mov             [dayValue + rax - 1], byte 0

;storing dayValue for string for isReallyNice
mov qword       rax, 0
mov             rdi, isReallyNice
mov		rsi, dayValue
call printf


;Output for salary
mov qword       rax, 0
mov             rdi, salaryFromUser
call printf

;input for salary
mov             rax, 0
mov             rdi, userSalary
mov             rsi, salary_string
mov             rdx, [stdin]
call            fgets

;line remove
mov             rax,0
mov             rdi, userSalary
call            strlen
mov             [userSalary + rax - 1], byte 0

;Output for salary message
mov qword       rax, 0
mov             rdi, salaryOutputMessage
mov             rsi, userSalary
call printf

;Output conclusion message
mov qword	rax, 0
mov		rdi, conclusionMessage
call printf

;Storing userName data into rax to use for C++
lea rax,	[userName]


;restore gpr's
popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rbp               


ret 
