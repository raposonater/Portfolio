

###############################
#FEEL FREE TO COMMENT OUT THE DATA AND TEXT HERE AND ADD THE OTHER PORTION FOR CHECKING PURPOSES
#It did not specify if I needed to include that, I only saw the method call portion and so that is all I am going to submit.
.data
textout:		.asciiz "The program requests an input:"

.text
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


	
		
	
