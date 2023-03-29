#ASSIGNMENT 1 QUESTION 8
#alexraposo@trentu.ca | ID: 0787601
#asks the user for 2 numbers, does a bunch of calculations just because it can lol.

.data
asknums: .asciiz "\nPlease enter your two numbers:\n"
outside: .asciiz "when added, your two numbers are outside the range 10-20\n"
inside: .asciiz "when added, your two numbers are inside the range 10-20\n"
breakline: .asciiz "\n"
remainderof: .asciiz "Remainder: "
.text
main:
#exit macro because useful
	.macro done
	li $v0,10
	syscall
	.end_macro
#macro to make output look pretty
	.macro breakline 
	la $a0, breakline # loads breakline into $a0
	li $v0, 4 #print string
	syscall # call os to perform print
	.end_macro
getnums:
	la $a0, asknums # loads asknum into $a0
	li $v0, 4 #print string
	syscall # call os to perform print
	
	li   $v0, 5 #gather integer from user
	syscall
	move $t0, $v0 #moving integer from $v0 to $t0
		
	li   $v0, 5 #gather integer from user
	syscall
	move $t1, $v0 #moving integer from $v0 to $t0	

operations:
	# a-b
	sub $t2, $t0, $t1 
	move $a0, $t2 # move the number to print into $a0. 
	li $v0, 1 # load syscall print_int into $v0. 
	syscall # make the syscall.
		
	breakline

	# a*b
	mult $t0, $t1
	mflo $t2
	move $a0, $t2 # move the number to print into $a0. 
	li $v0, 1 # load syscall print_int into $v0. 
	syscall # make the syscall.
	
	breakline	
	
	# a+b
	add $t5, $t0, $t1
	move $a0, $t5 # move the number to print into $a0. 
	li $v0, 1 # load syscall print_int into $v0. 
	syscall # make the syscall.
	
	breakline
	
	# a/b, if b!=0
	beq $0,$t1, rangecheck #branch if b is zero
	div $t0, $t1
	mflo $t2 #using mflo to get quotient, as mfhi gives remainder.
	move $a0, $t2 # move the number to print into $a0. 
	li $v0, 1 # load syscall print_int into $v0. 
	syscall # make the syscall.
	breakline
	
	#remainder because my soul is heavy if my program says 9/2 is 4
	la $a0, remainderof # loads remainderof into $a0
	li $v0, 4 #print string
	syscall # call os to perform print
	mfhi $t2 #using mfhi to get remainder
	move $a0, $t2 # move the number to print into $a0. 
	li $v0, 1 # load syscall print_int into $v0. 
	syscall # make the syscall.
	breakline
	
rangecheck:
	li $v0, 10 #creating range of 10
	move $t3, $v0 #storing 10
	li $v0, 20 #creating range of 20
	move $t4, $v0 #storing 20
	blt $t5, $t3, ending
	bgt $t5, $t4, ending
	la $a0, inside # loads inside into $a0
	li $v0, 4 #print string
	syscall # call os to perform print
	done
ending:
	la $a0, outside # loads outside into $a0
	li $v0, 4 #print string
	syscall # call os to perform print
	done

	