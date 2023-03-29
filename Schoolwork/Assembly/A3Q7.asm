#A3Q7
#alexraposo@trentu.ca | ID: 0787601
#matrix multiplcation and addition

#this is gonna look a little similar to my lab for no paticular reason at all, in no way whatsoever ¯\_(?)_/¯
.data 
Array1: 	.word 2,1,9,2
		.word 7,9,10,10
		.word 3,4,3,4
		.word 2,5,4,6
		
Array2:		.word 8,7,1,2
		.word 2,7,3,6
		.word 7,5,6,8
		.word 9,4,8,9

TransposedArray:.word 0,0,0,0
		.word 0,0,0,0
		.word 0,0,0,0
		.word 0,0,0,0
		
#random arrays generated at https://onlinemathtools.com/generate-random-matrix (1-10 range)
RandomArray1: 	.word 3,4,6,7
		.word 1,8,10,10
		.word 3,10,4,4
		.word 7,5,1,10
		
RandomArray2:	.word 5,8,1,5
		.word 1,9,3,4
		.word 6,2,4,2
		.word 1,9,3,3
		
size: 		.word 4  #4x4

space: 		.asciiz " "
nextline:	.asciiz "\n"
aplusB:		.asciiz "A+B"
axB:		.asciiz "A*B"
atranspose:	.asciiz "A Transpose"
.text

.macro displayint
	li $v0, 1
	syscall
.end_macro
.macro spacer
	la $a0 space
	li $v0, 4
	syscall
.end_macro
.macro next
	la $a0, nextline
	li $v0, 4
	syscall
.end_macro
.macro displaymessage
	li $v0, 4
	syscall
.end_macro

main:
la $s0, Array1 # base address
la $s1, Array2 # base address
la $s2, TransposedArray # base address
lw $a1, size # size
la $a0, aplusB
displaymessage
next
jal beginmethod 
next
next
la $a0, atranspose
displaymessage
next
jal transposemethod
next
next
la $a0, axB
displaymessage
next
jal multiplymethod
next
next
#2ND MATRICES
la $s0, RandomArray1 # base address
la $s1, RandomArray2 # base address
la $s2, TransposedArray # base address
lw $a1, size # size
la $a0, aplusB
displaymessage
next
jal beginmethod 
next
next
la $a0, atranspose
displaymessage
next
jal transposemethod
next
next
la $a0, axB
displaymessage
next
jal multiplymethod
#and done
li $v0, 10
syscall

beginmethod:

li $v0,0 #sum =0
li $t0,0 #t0 as the row index
li $t4,0 #t4 as the column index
j sumLoop

outersumLoop:
	li $t0, 0
	next
	
	sumLoop:	 
		mul $t3, $t0, 4 #changes to words at row index
		move $t1, $t3 
		
		sll $t3, $t4, 2 #multiply by 4
		mul $t3, $t3, $a1  #multiplies the row index(wds) by the size for column index
		add $t1,$t1,$t3 #adds column index
		
		
		add $t5, $s0, $t1 #Address for Array1+index
		add $t6, $s1, $t1 #Address for Array1+index
		lw $t2, ($t5)  #getting element from first array
		lw $t7, ($t6) #getting element from second array
		add $a0, $t7, $t2 #$a0 = array1[i][j]+array2[i][j]
 		#add $t5, $s2, $t1 #getting result array index
 		#sw $a0 ($t5) #store word in TransposedArray
 		#I AM GOING TO PUT THE OUTPUT HERE BECAUSE WHY NOT, IT MAKES SENSE
 		displayint
 		spacer
 		
		addi $t0, $t0, 1 # i = i+1
		blt $t0, $a1, sumLoop  #if i < size, loop again
		addi $t4,$t4,1 # j = j+1
		blt $t4, $a1, outersumLoop #if j < size, outerloop again

jr $ra  #return




###################
transposemethod:

li $v0,0 #sum =0
li $t0,0 #t0 as the row index
li $t4,0 #t4 as the column index
j transposeloop

#im not gonna lie, im gonna try something and if it works im gonna just laugh because this would be funny. what im gonna do is I'm just gonna switch which increments. HAHAHAHAH IT WORKED LOL
outertransposeloop:
	li $t4, 0
	next
	
	transposeloop:	 
		mul $t3, $t0, 4 #changes to words at row index
		move $t1, $t3 
		
		sll $t3, $t4, 2 #multiply by 4
		mul $t3, $t3, $a1  #multiplies the row index(wds) by the size for column index
		sll $t7, $t1, 2 #changes colum to row
		add $t1,$t1,$t3 #adds column index
		srl $t3, $t3, 2 #changes the row to column
		add $t7, $t7, $t3 #stores the transposed address
		
		
		add $t5, $s0, $t1 #Address for Array1+index
		add $t6, $s1, $t1 #Address for Array2+index
		lw $a0, ($t5)  #getting element from first array		#CHANGED T2 TO A0 HERE FOR DISPLAY INT
		displayint
 		spacer
 		
 		#this part just transposes b and stores it in an array so it's easier to do the A*B
		lw $a0, ($t6) #getting element from second array
 		add $t5, $s2, $t7 #getting result array index
 		sw $a0 ($t5) #store word in TransposedArray
 		#displayint
 		#spacer
 		#I AM GOING TO PUT THE OUTPUT HERE BECAUSE WHY NOT, IT MAKES SENSE
 		
		addi $t4, $t4, 1 # j = j+1
		blt $t4, $a1, transposeloop  #if j < size, loop again
		addi $t0,$t0,1 # i = i+1
		blt $t0, $a1, outertransposeloop #if i < size, outerloop again

jr $ra  #return


#########
multiplymethod:

li $v0,0 #sum =0
li $t0,0 #t0 as the row index
li $t4,0 #t4 as the column index
j mulLoop

outermulLoop:
#	what is in use?
#	t0, t1, t3, t4 | all for indexes and loops
	li $t0, 0
	next
	
	mulLoop:	 
		#personal note that $t1 holds the LR # and $t4 is UD #.
		mul $t3, $t0, 4 #changes to words at row index
		move $t1, $t3 
		
		sll $t3, $t4, 2 #multiply $t4 by 4
		mul $t3, $t3, $a1  #multiplies the row index(wds) by the size for column index
		add $t1,$t1,$t3 #adds column index
		
		li $s4, 0 #inner loop increment
		li $s5, 0 #inner loop row index
		li $a2, 0
		innermulLoop: #4long
		sll $s3, $t0, 4  #(shifts left 4 which muls by 16 and will be the set row (UD) for these operations) 	#ig ill store in $s3
		add $s3, $s3, $s5 #add the row and column indexes for transpose
		add $s6, $s5, $t3 #add interal row index and outer column index
		add $t5, $s0, $s6 #Address for Array1+index
		add $t6, $s2, $s3 #Address for Array2+index
		lw $t2, ($t5)  #getting element from first array
		lw $t7, ($t6) #getting element from transposed array
		
		mul $a0, $t7, $t2 #$a0 = array1[i][j]*array2[i][j]
		add $a2, $a2, $a0 # adds the sum to the accumulator
		
		addi $s5, $s5, 4
		#end of loop stage
		addi $s4, $s4, 1
		bne $s4, 4, innermulLoop
		move $a0, $a2
		displayint
 		spacer
 		
		addi $t0, $t0, 1 # i = i+1
		blt $t0, $a1, mulLoop  #if i < size, loop again
		addi $t4,$t4,1 # j = j+1
		blt $t4, $a1, outermulLoop #if j < size, outerloop again

jr $ra  #return
