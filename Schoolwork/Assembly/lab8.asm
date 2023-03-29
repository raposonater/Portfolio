#LAB8
#alexraposo@trentu.ca | ID: 0787601
#floating point numbers.

.data
a: .float 2.50
space: 		.asciiz " "
nextline:	.asciiz "\n"
parta:	.asciiz "Please enter two float values to multiply (I suggest, 1.5 and 2.5)"
partb:	.asciiz "Please enter two double values to multiply"
overed: .asciiz "1mil*1mil multiplication has overflowed"
.text

macros:
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

A:
la $a0, parta
displaymessage
next
li $v0 6
syscall
mov.s $f1, $f0
li $v0 6
syscall
mov.s $f3, $f0

next

mul.s $f12, $f1, $f3
li $v0 2
syscall

next
B:
la $a0, partb
displaymessage
next
li $v0 7
syscall
mov.d $f2, $f0
li $v0 7
syscall
mov.d $f4, $f0

next

mul.d $f12, $f2, $f4
li $v0 3
syscall
next

C:
#EXPERIMENTATION ( Single stepped back to see registers)
li $t0, 1000000 #1 mil
li $t1, 1000000 #1 mil
mul $t2, $t1, $t0 #1mil*1mil = 1tril
li $t0, 10 
li $t1, 10 
mul $t2, $t1, $t0 
li $t0, 10000 
li $t1, 10000 
mul $t2, $t1, $t0 
#if the number overflows,then the hi register has a value > 0. so just beq $hi $zero
li $t0, 1000000 #1 mil
li $t1, -1000000 #-1 mil
mul $t2, $t1, $t0 #-1mil*1mil = -1tril
##### END EXPERIMENTS


#THIS PART OF THE CODE, ALTHOUGH NOT DISPLAYING ANYTHING, CHECKS THE HI REGISTER AFTER UNSIGNED MULTIPLICATION, TO SEE IF HI IS ZERO, IF TRUE, NO OVERFLOW HAS OCCURED, OTHERWISE, OVERFLOW.
li $t0, 1000000 #1 mil
li $t1, 1000000 #1 mil
mulu $t2, $t1, $t0 
mfhi $t3
beq $t3, $zero after
jal over
after:
li $t0, 10 
li $t1, 1000000
mulu $t2, $t1, $t0 
mfhi $t3
beq $t3, $zero, after2
jal over
after2:


end:
li $v0, 10
syscall



over:
la $a0 overed
displaymessage
jr $ra

