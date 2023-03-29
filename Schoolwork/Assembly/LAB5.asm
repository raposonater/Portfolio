#LAB5
#alexraposo@trentu.ca | ID: 0787601
#I don't know why this is a lab
#We literally declare 20 bytes in memory as an array that can hold 5 integers. Then I use a loop to print them.

.data
	myArray: .space 20 #allocates 12 bytes/3 words
	message: .asciiz "The numbers in the array are:"
	newline: .asciiz "\n"
.text
	.macro linespace
	la $a0 newline
	li $v0 4
	syscall
	.end_macro 
	#loading the numbers for the lab
	li $s0, 1
	li $s1, 3
	li $s2, 5
	li $s3, 7
	li $s4, 9
	sw $s0, myArray($t0) #t0 is by default 0 when a program compiles here
	addi $t0, $t0, 4
	sw $s1, myArray($t0)
	addi $t0, $t0, 4 
	sw $s2, myArray($t0)
	addi $t0, $t0, 4 
	sw $s3, myArray($t0)
	addi $t0, $t0, 4 
	sw $s4, myArray($t0)
	
	la $a0, message
	li $v0, 4
	syscall
	linespace
looper:
	beq $t1, 20 ,exit
	
	lw $a0 myArray($t1)
	li $v0 1
	syscall
	linespace
	addi $t1, $t1, 4
	
	j looper
	
	
exit:
	li $v0, 10
	syscall
