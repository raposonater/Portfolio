#ASSIGNMENT 2 QUESTION 1
#alexraposo@trentu.ca | ID: 0787601
#for loops and shit lol

.text
#Assume that the values of a, b, i and j are in registers $s0, $s1, $t0, and $t1,
#respectively. Also assume the register $s2 holds the base address of the array D
#for(i=0; i<a; i++)
#	for(j=0; j<b; j++) #increments after loop
#		D[4*j] =i+j;

#optional values
	li $s0, 8
	li $s1, 2
	move $s2,$sp
	addi $s2, $s2, -16
j arraypart

loop1:
	li $t1, 0
	addi $t0, $t0, 1 #add one to i
	j arraypart
loop2:
	addi $t1, $t1, 1 #add one to j
arraypart:
	beq $t1, $s1, loop1 #going to the outer loop if j = b here to catch before executing again.
	beq $t0, $s0, end
	
	#I JUST REALISED THIS IS GOING TO OVERWRITE THE ARRAY MANY TIMES...
	sll $t2, $t1, 4 #storing 4*j #this is complicated because one word is 4 bits long which means sll will be one space, but we need 4* that space so we need to sll by 4
	add $t3, $s2, $t2 #adding 4*j to get to the proper data location, storing in $t3
	add $t4, $t0, $t1 #i+j in $t4
	sw $t4, 0($t3) #storing i+j in D[4*j]
	
	bne $t1, $s1, loop2  
	
	 
end:
	li $v0, 10
	syscall
	