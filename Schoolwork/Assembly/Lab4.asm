#LAB4
#alexraposo@trentu.ca | ID: 0787601
#This program initializes three numbers, my goal is to load those numbers onto a stack, then replace the values in those registers, do some math with them,
#and reinstate the original values using the stack.
.data
textout:		.asciiz "The program requests an input:"
before:		.asciiz "Before calling leaf: the values of $s0, $s1, $s2 are "
after:		.asciiz "After calling leaf: the values of $s0, $s1, and $s2 are "
newline:		.asciiz "\n"
space: 		.asciiz " "

.macro display_$s0_$s1_$s2
move $a0, $s0
li $v0, 1
syscall
 
la $a0, space
li $v0, 4
syscall

move $a0, $s1
li $v0, 1
syscall

la $a0, space
li $v0, 4
syscall

move $a0, $s2
li $v0, 1
syscall

la $a0, newline
li $v0, 4
syscall
.end_macro

.text
main:
li $s0, 1	# assign 1 to $s0  
li $s1, 2	# assign 2 to $s1  
li $s2, 3	# assign 3 to $s3  

la $a0, before
li $v0, 4
syscall

display_$s0_$s1_$s2	# print their values before calling leaf

jal leaf

la $a0, after
li $v0, 4
syscall
display_$s0_$s1_$s2	# print their values after calling leaf

#done
li $v0 10
syscall



###############################
#FEEL FREE TO REMOVE THE TOP PORTION AND UNCOMMENT THE .DATA AND .TEXT DOWN HERE IF THAT IS ALL YOU NEED
#I was unsure what exactly to submit, this will run and show that the registers gain these new numbers and add them, then reinstate the original numbers
#.data
#textout:		.asciiz "The program requests an input:"

#.text
leaf:

startstack:
#this whole process just decrements the stack pointer to allocate memory for the values, and then stores the value
addi $sp, $sp, -4 
sw $s0, 0($sp) 
addi $sp, $sp, -4 
sw $s1, 0($sp)
addi $sp, $sp, -4
sw $s2, 0($sp) 

# this is the start of the bit you're going to make into a called procedure
# print text, get an input
la $a0 textout
li $v0 4
syscall
li $v0 5 #gather int from user
syscall
move $s0, $v0 #copy the first value to $s0
#print out some more text, read in another value
li $v0 4
syscall
li $v0 5
syscall
move $s1, $v0# move result into $s1


add $s2 $s0, $s1 #add $s1 and $s2


#this whole process reinstates the saved values via incrementation to their original state, but in reverse prodecure because it is a stack.
returnstack:
lw $s2, 0($sp) 
addi $sp, $sp, 4 
lw $s1, 0($sp) 
addi $sp, $sp, 4 
lw $s0, 0($sp) 
addi $sp, $sp, 4 

jr $ra
#end of bit you need to make into a called procedure





#done
li $v0 10
syscall


	
		
	
