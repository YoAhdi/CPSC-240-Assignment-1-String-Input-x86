/****************************************************************************************************************************

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

 

; */

//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**



#include <stdio.h>
#include <stdint.h>                                        
#include <ctime>
#include <cstring>
#include <iostream>
#include <string>
extern "C" char* hello();                            


int main(){
                              
char *userName;
  printf("Welcome to to the friendly 'Hello' program created by Ahad Ahmad.\n");
userName = hello();
printf("Have a nice day ");
std::cout << userName;
  printf("\n.Bye. the integer zero will be returned to the operating system");

  return 0;                                                 

}
