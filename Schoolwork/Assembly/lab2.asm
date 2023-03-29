#LAB2
#alexraposo@trentu.ca
#asks the user for 2 numbers, prints the bigger number. loops 5 times.

.data
asknum: .asciiz "\nPlease enter your two numbers:\n"

#answer: .asciiz "\nThe bigger number entered is:\n"
.text
main:
	.macro done
	li $v0,10
	syscall
	.end_macro
	li $t3, 1
loopbegin:
 	add $t4, $t4, $t3 #incrementing loop
	
	
gatherfirst:
	#gather first int | somehow i made it work properly
	la $a0, asknum # loads asknum into $a0
	li $v0, 4 #print string
	syscall # call os to perform print
	li   $v0, 5 #gather integer from user
	syscall
	move $t0, $v0 #moving integer from $v0 to $t0			| I FOUND OUT I DONT NEED TO DO A SYSCALL HERE?
	
	#PRINTING INT TO CHECK
	#move $a0, $t0 # move the number to print into $a0. 
	#li $v0, 1 # load syscall print_int into $v0. 
	#syscall # make the syscall.
	
	
gathersecond:
	li   $v0, 5 #gather integer from user
	syscall
	move $t1, $v0 #moving integer from $v0 to $t0	


branching:
	bgt $t0, $t1, t0_bigger #this will branch to t0bigger if t0 is greater, basically stores the bigger number
	move $t2, $t1
	b endif
	
t0_bigger:
	move $t2, $t0 # copy $t0 into $t2 
	
endif:
	#printing int	
	#la $a0, answer # loads asknum1 into $a0 	|I HAD A BUNCH OF TEXT TO MAKE IT SEEM USER FRIENDLY BUT THEN I CANT SCREENSHOT THE WHOLE THING LOL
	#li $v0, 4 #print string
	#syscall # call os to perform print
	move $a0, $t2 # move the number to print into $a0. 
	li $v0, 1 # load syscall print_int into $v0. 
	syscall # make the syscall.
	
	bne $t4, 5, loopbegin #loop back to beginning if not at run 5
	
	
end:
	done
	
	
#SOMETHING TO NOTE ABOUT BRANCHES IS THEY ARE KINDA LIKE CHECKPOINTS IN A LEVEL.
	
	
	
