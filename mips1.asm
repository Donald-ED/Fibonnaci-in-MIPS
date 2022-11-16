.text #assembly language instructions
    main: #start of code
    	li $v0, 4 #calls prompt to take in an integer
 	    la $a0, prompt #loads address and puts the interger value in register $a0
 	    syscall #system call
 	
 	    li $v0, 5
 	    syscall
 	    move $t0, $v0 #move content of $v0 to $t0
    	while: 
    	#while loop
    		bgt $t0, 25, exit #conditon to check if the integer is greter than 25
    		#if it is we jump to exit
    		
		li $v0, 4 #system call
    		la $a0, illegal #laods address and outputs the value stored in the variable
    		syscall 
    		
    		li $v0, 4 #system call
 		la $a0, prompt #calls prompt again to get an integer
 		syscall 
    		
    		li $v0, 5
		syscall
 		move $t0, $v0 #move $v0 to $t0
    		
    		j while #call the while again
    		
    	exit:
		move $a0, $v0
		jal fib   #calls the funtion fib and runs it 
		move $a1, $v0
		
    		li $v0, 4 
    		la $a0, output #calls the variable "output"
    		syscall 
    		
    		li $v0, 1
 		move $a0, $t0 
 		syscall
    	
    	li $v0, 10 #terminates condition
    	syscall



fib:
    li $t0, 0 #fn 
    li $t1, 1 #fn1
    li $t2, 1 #fn2
    move $t3, $a0 #takes the input integer from prompt and moves it to $t3
    sub $t4, $t3, 2 #subtracts 2 from the value in $t3 and place it in $t4
    li $v0,1
    li $t5, 0 #counter starts at 0

    beq $t3, 0, done #condition to check if n== 0 
    bne $t3, 1, else #condition to check n!=1

else: #if n!=1
    li $v0,1
    move $a0, $t0 #print fn == 0
    syscall
    li $v0, 4        
    la $a0, newline #print newline
    syscall 	
    li $v0,1
    move $a0, $t1 #print fn1 == 1
    syscall
    li $v0, 4        
    la $a0, newline #print newline
    syscall 
    li $v0,1
    move $a0, $t2 #print fn2 == 1
    syscall
    li $v0, 4        
    la $a0, newline #print newline
    syscall 



loop:
    beq $t5, $t4, done # for i in range $t4, $t5 == i.
    add $t0, $t1, $t2  #fn = fn1 + fn2
    add $t1, $zero, $t2  #fn1 = fn2
    add $t2, $zero, $t0   #fn2 = fn
    li $v0,1
    move $a0, $t0   #trying to print fn
    syscall   #printing fn
    li $v0, 4        
    la $a0, newline #printing newline
    syscall 
    addi $t5, $t5, 1 #increase i by 1
    j loop #jump back to loop 


done:
    li $v0, 10 #terminates program
    syscall

.data
    prompt: .asciiz "Please enter an integer: "
    output: .asciiz "\nYou typed the number "
    illegal: .asciiz "illegal Number!\n"
    newline: .asciiz "\n"
