#ASSIGNMENT 1 QUESTION 9
#alexraposo@trentu.ca | ID: 0787601
#asks the user for a number between 0 and -5, puts that number to the power of 4, then gets the factorial of that resulting number 

.data
asknums: .asciiz "Enter a negative integer (0 to -5):\n "
error: .asciiz "Error: Input must be (0 to -5)\n"
factorialmessage: .asciiz "the factorial of your number^4 is: "
zerofactorial: .asciiz "The factorial of 0^4 is actually 1!"
.text
	.macro done
	li $v0,10
	syscall
	.end_macro

j begin
errorzone:
	la $a0, error # loads error into $a0
	li $v0, 4 #print string
	syscall # call os to perform print
begin:
	la $a0, asknums # loads asknums into $a0
	li $v0, 4 #print string
	syscall # call os to perform print
	
	li   $v0, 5 #gather integer from user
	syscall
	move $t0, $v0 #moving integer from $v0 to $t0
	
	li $v0, -5 #creating -5
	move $t8, $v0 #storing -5
	blt $t0, $t8, errorzone
	bgt $t0, $0, errorzone
	beq $t0, $0, funnycase
	

    	li $t3, 3 #loop counter
	move $t1, $t0 #just making a copy so the exponent function works
	
exponent:

    	mul $t1,$t1,$t0 #multiplying the values
    	sub $t3, $t3, 1 #decerement loop
    	bgtz $t3, exponent #loop back
	
	move $t3, $t1 #loop counter
	addi $t3, $t3, -1 #so it properly does a factorial
factorial:
	#I FOUND OUT ABOUT MUL HERE AND I WAS WORRIED SOMETHING WEIRD MIGHT HAPPEN BUT IT TURNS OUT IM JUST CRAZY LOL | went back to change other mult to mul | Did some cool stack overflow reading on the differences.
	mul $t1,$t1,$t3 #multiplying the values
	sub $t3, $t3, 1 #decerement loop
	bgtz $t3, factorial #loop back
	
finallydoneColonD:
	li $v0, 4
    	la $a0, factorialmessage
    	syscall
    	li $v0, 1
    	move $a0, $t1
    	syscall
    	#IN THE CASE OF -2, WHERE IT GIVES 16, WHICH IS 16 FACTORIAL OR 20,922,789,888,000. Due to the integer overflowing, the number goes all the way back to the negatives,
    	#resulting in a number that doesnt look like what you would expect. When dividing the actual 16! by 2,147,483,647, the max signed integer value, and getting the remainder,
    	#the number looks similar but slightly off. I had to do a little thinking to realise that there is actually an extra number added being 0. So i subtracted the 
    	#max signed integer value from 16! by the remainder of 9742 and got 2004198926 which is really close to what the program gives of 2004189184. 
    	#YOU THOUGHT I WAS DONE, BUT NO, I DIDNT FACTOR IN THE ZERO, MEANING I HAD TO SUBTRACT 1 MORE 9742 FROM 16! (i just thought of that 5s ago)
    	#AND YOU KNOW WHAT? IT IS CORRECT 2004189184. proof moment :D
    	#side note this was actually a really cool thing to investigate and I really like this question. thank you!
    	
ending:
		done    	
		
funnycase:
	la $a0, zerofactorial # loads the special case into $a0
	li $v0, 4 #print string
	syscall # call os to perform print
	j ending
