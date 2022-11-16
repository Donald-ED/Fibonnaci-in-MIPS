.data
    prompt: .asciiz "Please enter an integer: "
.text
main:
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0

