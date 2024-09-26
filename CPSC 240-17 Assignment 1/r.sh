#Author information
#
#  Author name: Ahad Ahmad
#  Author email: ahadahmad@csu.fullerton.edu
#  CWID: 886864362
#  Class: CPSC 240
# This is the file script for the hello program 

rm *.out

echo "Assembling hello.asm"
nasm -f elf64 -l hello.lis -o hello.o hello.asm

echo "Compiling welcome.cpp"
g++ -c -m64 -Wall -fno-pie -no-pie -l welcome.lis -o welcome.o welcome.cpp -std=c++2a

echo "Linking both welcome.o hello.o"
g++ -m64 -std=c++2a -o go.out hello.o welcome.o -fno-pie -no-pie

echo "Now the Hello program will run"
./go.out

