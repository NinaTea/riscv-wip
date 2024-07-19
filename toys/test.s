.section .text
.global _start

_start:
    li a0, 2 //guardamos estado 2 porque pinta
    li a7, 93 //93 es el codigo de la syscall exit
    ecall 