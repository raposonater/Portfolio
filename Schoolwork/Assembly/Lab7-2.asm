#LAB7-2
#alexraposo@trentu.ca | ID: 0787601
#matrix multiplcation and addition
#what is funny about this is my friend at work was showing me his math for business administration and it had matricies, It is an odd coincidence but I'm glad I was curious

.data 
#https://onlinemathtools.com/generate-random-matrix | useful tool for making a matrix when creativity is low...
#I REALISED THAT I ACTUALLY NEED TO USE THE MATRICES PROVIDED. I WAS CONFUSED
Array1: 	.word 0,5,7,2
		.word 1,2,5,6
		.word 6,0,1,5
		.word 1,0,6,4
		
Array2:		.word 1,7,8,7
		.word 4,6,5,5
		.word 4,8,2,7
		.word 6,1,8,0

ResultArray:	.word 0,0,0,0
		.word 0,0,0,0
		.word 0,0,0,0
		.word 0,0,0,0
		
size: 		.word 4  #4x4

space: 		.asciiz " "
nextline:	.asciiz "\n"
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

main:
la $s0, Array1 # base address
la $s1, Array2 # base address
la $s2, ResultArray # base address
lw $a1, size # size
jal beginmethod  #sum of diagonals, in our starting example, this is 9.  

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
		add $a0, $t7, $t2 #$v0 = array1[i][j]+array2[i][j]
 		add $t5, $s2, $t1 #getting result array index
 		sw $a0 ($t5) #store word in ResultArray
 		#I AM GOING TO PUT THE OUTPUT HERE BECAUSE WHY NOT, IT MAKES SENSE
 		displayint
 		spacer
 		
		addi $t0, $t0, 1 # i = i+1
		blt $t0, $a1, sumLoop  #if i < size, loop again
		addi $t4,$t4,1 # j = j+1
		blt $t4, $a1, outersumLoop #if j < size, outerloop again

jr $ra  #return