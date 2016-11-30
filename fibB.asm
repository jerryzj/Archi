# EE3450 Computer Architecture Project
# 103061232 Chong-yao,Zhang Jian
.text
.globl main

main:
    li      $v0, 5          # prepare for syscall 5,reading integer from the user
    syscall                 # syscall 5
    move    $a0, $v0        # copy user input n to $a0
    jal     fibo            # go to function fibo to do calculation
    move    $a0, $v0        # copy Fn to $a0 for syscall1 to print
    li      $v0, 1          # prepare for syscall 1,printing integer to the user
    syscall
    li      $v0, 10         # prepare for syscall10,exit
    syscall

fibo:

    addi    $v0, $t2, 0             # store result to $v0
    jr      $ra                     # return to main
