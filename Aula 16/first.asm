extern printf
extern exit

section .data
    msg DD "Hello World!",0
    msg2 DD "This is a test!",0
    fmt DB "Output is: %s %s",10,0

section .text
global main

main:
    push msg2
    push msg
    push fmt
    call printf
    push 1
    call exit