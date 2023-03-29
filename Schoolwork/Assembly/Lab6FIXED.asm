#LAB6
#alexraposo@trentu.ca | ID: 0787601
#this program asks you to enter two numbers, s and f. and then will add every number from s to f together recursively, so long as s <= f (added desc. at 8:33pm post class)
#START 5:28PM TUESDAY MARCH 14TH
#COMPLETE AT 5:40PM TUESDAY MARCH 14TH. | I had to eat an entire plate of rice in between the start and end of the code because dinner ig
#APOLOGIES FOR MY lack of intellegence


.data
msg1: .asciiz "this program asks you to enter two numbers, s and f. and then will add every number from s to f together recursively, so long as s <= f\n"
msg2: .asciiz "For example, if the first integer is 1 and the 2nd is 5, then the result is 15 because 1+2+3+4+5=15. \n"
msgs: .asciiz "Please Enter S:"
msgf: .asciiz "Please enter F:"
nextline: .asciiz "\n"
.text
textmoment:
la $a0 msg1
li $v0 4
syscall
la $a0 msg2
li $v0 4
syscall
la $a0 msgs
li $v0 4
syscall
li $v0 5
syscall
move $a2, $v0 #store lower bound in $a2
la $a0 msgf
li $v0 4
syscall
li $v0 5
syscall
move $a1, $v0 #store upper bound in $a1
move $a0, $a2 #move lower bound to $a0 for use in recursive function
jal mysum
move $a0, $v0
li $v0, 1
syscall
end:
li $v0 10
syscall



#provided code
mysum:
bne $a0, $a1, ms_recurse
move $v0, $a1
jr $ra

ms_recurse:
sub $sp,$sp,8
sw $ra, 0($sp)
sw $a0, 4($sp)
addi $a0, $a0, 1
jal mysum
lw $a0, 4($sp)
add $v0, $v0, $a0
lw $ra, 0($sp)
add $sp, $sp, 8
jr $ra



