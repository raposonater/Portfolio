#ASSIGNMENT 2 QUESTION 10 PART 1
#alexraposo@trentu.ca | ID: 0787601
#Takes an array of 16 integers and uses methods to find the largest and smallest numbers, and then the difference in their values
.data
intarray: .word 17, 2, 7, 6, 14, 1, 9, 20, 5, 18, 12, 13, 8, 3, 4, 11 #biggest is 20, smallest is 1, difference 19
space: .asciiz "\n"
.text
la $s0, intarray #setting $s0 to the base address of the array
addi $s1, $s0, 64 #setting $s1 as the end of the array
li $t0, 0 #this is our loop counter (waste)
.macro spacer
	la $a0, space # loads breakline into $a0
	li $v0, 4 #print string
	syscall # call os to perform print
.end_macro

main:

jal findLargest #returns to s2
	move $a0, $s2 # move the number to print into $a0. 
	li $v0, 1 # load syscall print_int into $v0. 
	syscall # make the syscall.
	spacer
jal findSmallest #returns to s3
	move $a0, $s3 # move the number to print into $a0. 
	li $v0, 1 # load syscall print_int into $v0. 
	syscall # make the syscall.
	spacer
jal range #returns to s4
	move $a0, $s4 # move the number to print into $a0. 
	li $v0, 1 # load syscall print_int into $v0. 
	syscall # make the syscall.


j end





findLargest: #will return to $s2
li $t1 -100000 #making sure that we get all the values that are low in case you wanted to put in negative numbers (although its not perfect)

largeLoop:
add $t2, $s0, $t0 #changing the base address of the array to $t2 to change which element we are accessing
beq $t2, $s1, largeReturn #checking if the end of the array is reached and branching if true
lw $t3, 0($t2) #loading the number in the array to be tested to $t3
addi $t0, $t0, 4 #increment array index
bgt $t3,$t1, largesetcase #branching if current number is greater than biggest number
j largeLoop

largesetcase: #this case changes the current largest number, and is only accessed if the current number is greater than the current largest.
move $t1, $t3
j largeLoop

largeReturn: #In this process, values are returned to their original states and the result of the function is saved
move $s2, $t1
move $t0, $0
jr $ra



	
findSmallest: #will return to $s3
li $t1 100000 #making sure that we get all the values that are high in case you wanted to put in really big numbers (although its not perfect)

smallLoop:
add $t2, $s0, $t0 #changing the base address of the array to $t2 to change which element we are accessing
beq $t2, $s1, smallReturn #checking if the end of the array is reached and branching if true
lw $t3, 0($t2) #loading the number in the array to be tested to $t3
addi $t0, $t0, 4 #increment array index
blt $t3,$t1, smallsetcase #branching if current number is less than smallest number
j smallLoop

smallsetcase:  #this case changes the current smallest number, and is only accessed if the current number is smaller than the current smallest.
move $t1, $t3
j smallLoop

smallReturn: #In this process, values are returned to their original states and the result of the function is saved
move $s3, $t1
move $t0, $0
jr $ra




range: # will return to $s4
move $t7, $ra #storing the return address so we can go deeper
jal findLargest
jal findSmallest
sub $s4, $s2, $s3 #subtracting findsmallest from findlargest
jr $t7 




end: 
li $v0 10
syscall