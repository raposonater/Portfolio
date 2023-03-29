#LAB3
#alexraposo@trentu.ca | ID: 0787601
#asks the user for 2 numbers, adds them, checks if inside the range of 20-50.

.data
asknums: .asciiz "\nPlease enter your two numbers:\n"
outside: .asciiz " is outside the range\n"
inside: .asciiz " is inside the range\n"
edge: .asciiz " is on the edge\n"

.text
main:
#simple exit macro because its useful as heck
	.macro done
	li $v0,10
	syscall
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
	
setrange:
	li $v0, 20 #creating range of 20
	move $t3, $v0 #storing 20
	li $v0, 50 #creating range of 50
	move $t4, $v0 #storing 50
	
addphase:	
	add $t2, $t0, $t1 #adding the numbers together
	
rangecheck:
	move $a0, $t2
	li $v0, 1 # load syscall print_int into $v0. 
	syscall # make the syscall.
	
	#branching if outside range
	blt $t2,$t3,outsidecase
	bgt $t2,$t4,outsidecase
	
	#branching if on edge
	beq $t2,$t3,edgecase
	beq $t2,$t4,edgecase
	
insidecase:
	la $a0, inside #loading relevant string
	li $v0, 4 #print string
	syscall
	b endphase
	
outsidecase:
	la $a0, outside #loading relevant string
	li $v0, 4 #print string
	syscall
	b endphase 

edgecase:
	la $a0, edge #loading relevant string
	li $v0, 4 #print string
	syscall
	
	
endphase: #just a shortcut to the ending of the program (i know a little inefficient but it looks nice)
	done





