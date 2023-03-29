#ASSIGNMENT 2 QUESTION 10 B SIDE
#alexraposo@trentu.ca | ID: 0787601
#Takes an array of 16 integers and uses a recursive method to find the largest number | RECURSIVELY (for some unknown reason)
#TECHNICALLY SPEAKING, IT IS A RECURSIVE PROGRAM. DOES THE RECURSION ACCOMPLISH ANYTHING USEFUL? NO!
.data
intarray: .word 17, 2, 7, 6, 14, 1, 9, 20, 5, 18, 12, 13, 8, 3, 4, 11 #biggest is 20, smallest is 1, difference 19
space: .asciiz "\n"
.text
la $s0, intarray #setting $s0 to the base address of the array
addi $s1, $s1, 16 #setting $s1 as the size of array
li $t1 -100000 #exclusively here for find largest recursive.
.macro spacer
	la $a0, space # loads breakline into $a0
	li $v0, 4 #print string
	syscall # call os to perform print
.end_macro

main:

jal findLargestRecursive #returns to s2
	move $a0, $t1 # move the number to print into $a0. 
	li $v0, 1 # load syscall print_int into $v0. 
	syscall # make the syscall.
	spacer

j end

			
						
#################################	#################################	#################################									
												
															
																		
#I'm not gonna lie I basically stole the layout from my Lab6 and just ran with it. There is no reason to use recursion here, it is literally slower. Since MIPS is the in-between for high level and machine. This just makes it abundantly clear that recursion is slower than looping, it just happens to be that recursion solves some problems better.																						
findLargestRecursive:
bne $t2, 16, Rbody 
jr $ra

#A cool observation I have made regarding recursion, is that it is basically just doing something, and then undoing it because you can.
Rbody:
#### Chunk stores the RA and the number
sub $sp, $sp, 8
sw $ra, 0($sp) #store the return adress
lw $t0, 0($s0) #load the number from the array
addi $s0, $s0, 4 
sw $t0, 4($sp) #store the number in the stack (which is pretty useless but ig its for recursion(yipee))
addi $t2, $t2, 1 #this is just to make it a little loop ig?
#####
jal findLargestRecursive
### chunk uses the stack pointer and the temporary pointer at the top of the stack to load the ra and the integers in order, respectively.
lw $t0, 4($sp) #top stack pointer getting the number
bgt $t0, $t1, bigger #checking if temp>current num (recursively)
j after
bigger:
move $t1, $t0
after:
lw $ra, 0($sp) #bottom stack pointer getting the ra
addi $sp, $sp, 8 #inc/decrementing sp's
jr $ra
#####


end:
li $v0, 10
syscall