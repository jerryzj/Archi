# EE3450 Computer Architecture Project
# 103061232 Chong-yao,Zhang Jian
.text
.globl main
main:
    li      $v0, 5          # prepare for syscall 5,reading integer from the user
    syscall                 # syscall 5
    move    $a0, $v0        # copy user input n to $a0
    jal     fibo            # go to function fibo to do calculation
    move    $a0, $v0        # copy Fn to $a0 for syscall 1 to print
    li      $v0, 1          # prepare for syscall 1,printing integer to the user
    syscall                 # syscall 1
    li      $v0, 10         # prepare for syscall 10,exit
    syscall                 # syscall 10

fibo:
    addi    $sp, $sp, -12           # save in stack
    sw      $ra, 0($sp)
    sw      $s0, 4($sp)
    sw      $s1, 8($sp)

    slti    $t1, $a0, 2             # if n = 0 or 1, set $t2 = 1
    bne     $t1, $zero, return_exc  # when n = 0 or 1, go to return_exc

    add     $s0, $a0, $zero
    addi    $a0, $s0, -1            # n-1 store in $a0
    jal     fibo                    # Calling fibo(n-1)

    add     $s1, $v0, $zero         # store fibo(n-1) in $s1
    addi    $a0, $s0, -2            # n-2 store in $a0
    jal     fibo                    # Calling fibo(n-2)

    add     $v0, $v0, $s1           # $v0 = fibo(n-2) + fibo(n-1)
    j       return                  # go to return

return_exc:
    addi    $v0, $a0, 0             # store n to $v0, then return n

return:
    lw      $ra, 0($sp)             # read registers from stack
    lw      $s0, 4($sp)
    lw      $s1, 8($sp)
    addi    $sp, $sp, 12            # bring back stack pointer
    jr      $ra                     # return n to main
