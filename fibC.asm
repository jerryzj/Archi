# EE3450 Computer Architecture Project
# 103061232 Chong-yao,Zhang Jian
.text
.globl main
main:
    li      $v0, 5          # prepare for syscall 5,reading integer from the user
    syscall                 # syscall 5
    move    $a0, $v0        # copy user input n to $a0
    li      $a1, 1          # let $a1 = 1 (int a)
	li      $a2, 0          # let $a2 = 0 (int b)
    jal     fibo            # go to function fibo to do calculation
    move    $a0, $v0        # copy Fn to $a0 for syscall 1 to print
    li      $v0, 1          # prepare for syscall 1,printing integer to the user
    syscall                 # syscall 1
    li      $v0, 10         # prepare for syscall 10,exit
    syscall                 # syscall 10

fibo:
	beq     $a0, $zero, return_0    # if n = 0,go to return_0
    add     $t0, $a1, $a2           # $t0 = a + b
    addi    $a2, $a1, 0             # arg2 = a
    addi    $a1, $t0, 0             # arg1 = a + b
    addi    $a0, $a0, -1            # n = n-1
    j       fibo                    # call tail_recu(a+b, a, n-1)

return_0:
    addi    $v0, $a2, 0             # store 0 to $v0
    jr      $ra                     # return
