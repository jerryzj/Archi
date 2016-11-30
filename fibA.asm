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

    bne     $a0, $zero, loophead    # if n is not equal to 0,go to loophead
    li      $v0, 0                  #
    jr      $ra                     # return to main with value 0

loophead:
    li      $t0, 0          # let $t0 = Fn_2 with value 0
    li      $t1, 1          # let $t1 = Fn_1 with value 1
    li      $t2, 1          # let $t2 = Fn   with value 1
    li      $t3, 2          # let $t3 as looping index "i" with value 2
    addi    $t4, $a0, 1     # let $t4 = n + 1 for condition checking
    slt     $t5, $t3, $t4           # if i < n+1, set $t5 = 1
    beq     $t5, $zero, loopend     # if i > n+1, loopend

loopbody:

    addi    $t3, $t3, 1             # looping index increment
    add     $t2, $t1, $t0           # Fn = Fn-1 + Fn-2
    addi    $t0, $t1, 0             # Shift for Fn iteration
    addi    $t1, $t2, 0             # Shift for Fn iteration
    slt     $t5, $t3, $t4           # if i < n+1, set $t5 = 1
    bne     $t5, $zero, loopbody    # if i < n+1, continue looping

loopend:
    addi    $v0, $t2, 0             # store result to $v0
    jr      $ra                     # return to main
