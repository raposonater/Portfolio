#LAB7-1
#alexraposo@trentu.ca | ID: 0787601
#matricies (which i havent fully learned about yet because The linear algebra class was full :( )

#correct array index assuming row major order is just [i*4]+[j*4*row length]


#I DIDN'T COPY THE WORD DOC LAST TIME AND FOR SOME REASON GOT MARKED DOWN WHEN THE CODE WORKED, I EVEN CHECKED AFTER IT WAS MARKED AND IT WORKS I SWEAR
#so this time i copy the code provided instead of trying my own stuff...
.data 
# the next two lines define an array (mdArray as a 2x2 multidimensional array)
mdArray: 	.word 2,5,8,11  
		.word 3,7,11,15
		.word 4,9,14,19
		.word 5,11,17,23
# i think that being able to declare a 2d array like this is really really cool. but I'm gonna look into a 3d array because I'm very curious
		
size: .word 4  #dimension of the array (2x2 in this case, note this is only for square matrices)
.eqv DATA_SIZE 16 # number of bytes per element, 4 for ints, 1 for chars, 8 for doubles

.text
main:
la $a0, mdArray # base address
lw $a1, size # size
jal sumDiagonal  #sum of diagonals, in our starting example, this is 9.  
move $a0, $v0 # this is because sumDiagonal will return it's last value in $v0
li $v0, 1
syscall

#and done
li $v0, 10
syscall

sumDiagonal:

li $v0,0 #sum =0
li $t0,0 #t0 as the index

	sumLoop: 
		# The next 4 lines are the bit you need to derive and fill in yourself
		mul $t3, $t0, 4 #changes to words at row index
		add $t1,$a0,$t3 #adds the row index to the base address of array
		mul $t3, $t3, $a1 #multiplies the row index(wds) by the size for column index
		add $t1,$t1,$t3 #adds column index

		lw $t2, ($t1)  #getting element 
		add $v0, $v0, $t2 # sum = sum + mdArray[i][i]
 
		addi $t0, $t0, 1 # i = i+1
		blt $t0, $a1, sumLoop  #if i < size, loop again

jr $ra  #ends sum diagonal
#on the 4x4 array I made the result is 2+7+14+23= 46
