# print_array.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0, $a1
#   make all returned values from functions go in $v0

# Example array and alen - your code should work for any integer array of any length > 1.
.data
    array:  .word 6, 4, 0, 1, 2, 9, 3, 5, 8, 7
    alen:   .word 10
    newline: .asciiz "\n"
    space:  .asciiz " "

.text
bubble:
	# CODE MISSING: Student to complete this part
	lw $t2, 0($a1)
	addi $t0, $t2, -1
bFor1:
	blt $t0, $zero, postBFor1
	li $t3, 1
bFor2:
	bgt $t3, $t0, postBFor2
	addi $t4, $t3, -1
	sll $t7, $t4, 2
	sll $t8, $t3, 2
	add $t7, $a0, $t7
	add $t8, $a0, $t8
	lw $t5, 0($t7)
	lw $t6, 0($t8)

	ble $t5, $t6, postIf
	move $t1, $t5
	sw $t6, 0($t7)
	sw $t1, 0($t8)
postIf:
	addi $t3, $t3, 1
	j bFor2
postBFor2:
	addi $t0, $t0, -1
	j bFor1
postBFor1:
	jr $ra

printArray:
	# CODE MISSING: Student to complete this part
	li $t0, 0
	move $t1, $a0
	lw $t2, 0($a1)
for:
	bge $t0, $t2, postFor
	li $v0, 1
	sll $t3, $t0, 2
	add $t3, $t1, $t3
	lw $a0, 0($t3)
	syscall
	li $v0, 4
	la $a0, space
	syscall
	addi $t0, $t0, 1
	j for
postFor:
	li $v0, 4
	la $a0, newline
	syscall
	jr $ra

main:
    la $a0, array
    la $a1, alen
    jal printArray

    la $a0, array
    la $a1, alen
    jal bubble

    la $a0, array
    la $a1, alen
    jal printArray

    li $v0, 10
    syscall	
