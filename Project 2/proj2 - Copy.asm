#Name: Bobby Bose
#Program: Project 2

.data
msg1: .asciiz "\n"

.text

main:
	li $t1, 0					#To keep track of how many characters on stack
	
readIn:
	li $v0, 12					#Set $v0 to 12 to read in character

	addi $t1, $t1, 1			#A character is being put onto the stack
	addi $sp, $sp, -4			#Moving stack pointer for next character
	
	syscall						#Reading in character
	
	sw $v0, ($sp)				#Storing read in character on stack
	
	bne $v0, 63, readIn			#Branch back to readIn if the character read wasn't a '?'

setUp:
	li $v0, 4					#syscall for string
	la $a0, msg1				#Loading "\nArray C: "
	syscall						#Printing

	addi $sp, $sp, 4			#Moving stack pointer past '?'
	addi $t1, $t1, -1			#'?' removed from stack
	
	li $v0, 11					#Set $v0 to 11 to print out string
	
secondPhase:
	li $a0, 0					#Setting $a0 to 0
	
	lw $a0, ($sp)
	addi $sp, $sp, 4			#Moving stack pointer past current character
	addi $t1, $t1, -1			#A character is removed from stack
	
	
	slti $t0, $a0, 91			#If character is uppercase, $t0=1, else $t0=0 
	beq $t0, 1, toLower			#Branching to toLower if character is uppercase
	
toUpper:
	addi $a0, $a0, -32			#Adding -32 to character to change to uppercase
	beq $zero, $zero, printOut	#Branching past toLower
	
toLower:
	addi $a0, $a0, 32			#Adding 32 to character to change to lowercase

printOut:
	syscall						#Printing out current modified character
	bne $t1, 0, secondPhase		#If there are still characters on stack, branch back to secondPhase