.data
    prompt: .asciiz "Please enter an integer: "
    illegal: .asciiz "illegal Number"
    newline: .asciiz "\n"
.text
main:
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0
    while:
        beq $t0, 0, exit
        bgt $t0, 35, exit
        
        li $v0, 4
        la $a0, illegal
        syscall
        
        li $v0, 4
        la $a0, prompt
        syscall
        
        li $v0, 5
        syscall
        move $t0, $v0
        
        j while
    exit:
        li $v0, 4
        la $a0, output
        syscall
        
        li $v0, 1
        move $a0, $t0
        syscall
        
    li $v0, 10
    syscall



fib:
    li $t0, 0
    li $t1, 1
    li $t2, 1
    
    move $t3, $a0
    sub $t4, $t3, 2
    li $v0, 1
    li $t5, 0
    
    beq $t3, 0, done
    bne $t3, 1, else
    
    else:
    li $v0, 1
    move $a0, t0
    syscall
    
    li $v0, 4        
    la $a0, newline
    syscall 
