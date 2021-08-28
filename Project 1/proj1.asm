#Name: Bobby Bose
#Program: Project 1
#Inputs can be changed in main function by changing numbers following .word

# $s1 = A[0]	Store address of A[0] in $s1
# $s2 = B[0]	Store address of B[0] in #s2
# $s3 = C[0]	Store address of C[0] in $s3

# $t0 = A[i]	Current element in A
# $t1 = B[i]	Current element in B

.data

msg1: .asciiz "Array A: "
msg2: .asciiz "\nArray B: "
msg3: .asciiz "\nArray C: "
msg4: .asciiz ", "

.text

main:
	.data
	
	A:	.word 1 2 3 4 5 6 7 8 9 10
	B:	.word 11 12 13 14 15 16 17 18 19 20
	C:	.word 0:10 
	
	.text
	
	la $s1, A
	la $s2, B
	la $s3, C 
	
	li $s0, 0
	li $t4, 40	
		
addition:

	add $t2, $s0, $s1		#Putting current A value in $t0
	lw $t0, ($t2)
	
	add $t2, $s0, $s2		#Putting current B value in $t1
	lw $t1, ($t2)

	add $t2, $s0, $s3		#t2 = C[0] + Offset
	add $t3, $t0, $t1		#t3 = A[i] + B[i] 
	sw $t3, ($t2)			#Storing $t3 in $t2
	
	add $s0, $s0, 4
	
	bne $s0, $t4, addition
		
printAL:
	li $v0, 4			#syscall for string
	la $a0, msg1		#Loading "Array A: "
	syscall				#Printing
	li $s0, 0			#Setting s0 (offset) to 0
	
printA:
	add $t2, $s0, $s1
	lw $t0, ($t2)		#Current word in Array A
	
	li $v0, 1			#syscall for int
	add $a0, $t0, $zero		#Loading current word in A
	syscall				#Printing
	
	li $v0, 4			#syscall for string
	la $a0, msg4		#Loading ", "
	syscall				#Printing
	
	add $s0, $s0, 4		#Increasing offset by 4
	
	bne $s0, 40, printA		#If 10 words haven't been printed yet, branch back to printA

printBL:
	li $v0, 4			#syscall for string
	la $a0, msg2		#Loading "\nArray B: "
	syscall				#Printing
	li $s0, 0			#Setting s0 (offset) to 0
	
printB:
	add $t2, $s0, $s2
	lw $t0, ($t2)		#Current word in Array B
	
	li $v0, 1			#syscall for int
	add $a0, $t0, $zero		#Loading current word in B
	syscall				#Printing
	
	li $v0, 4			#syscall for string
	la $a0, msg4		#Loading ", "
	syscall				#Printing
	
	add $s0, $s0, 4		#Increasing offset by 4
	
	bne $s0, 40, printB		#If 10 words haven't been printed yet, branch back to printA	
	
printCL:
	li $v0, 4			#syscall for string
	la $a0, msg3		#Loading "\nArray C: "
	syscall				#Printing
	li $s0, 0			#Setting s0 (offset) to 0
	
printC:
	add $t2, $s0, $s3
	lw $t0, ($t2)		#Current word in Array C
	
	li $v0, 1			#syscall for int
	add $a0, $t0, $zero		#Loading current word in C
	syscall				#Printing
	
	li $v0, 4			#syscall for string
	la $a0, msg4		#Loading ", "
	syscall				#Printing
	
	add $s0, $s0, 4		#Increasing offset by 4
	
	bne $s0, 40, printC		#If 10 words haven't been printed yet, branch back to printA	
