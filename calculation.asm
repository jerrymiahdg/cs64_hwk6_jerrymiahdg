# calculation.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a-registers
#   make all returned values from functions go in $v0

.text
remove:
    # CODE MISSING: Student to complete this part
	sub $v0, $a1, $a0
	jr $ra

calc:
    # CODE MISSING: Student to complete this part
	
	# save original values in s & ra registers
	addiu $sp, $sp, -24
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $ra, 20($sp)
	
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	li $s3, 5
	li $s4, 0
for:
	bge $s4, $s2, postFor
	sll $t0, $s1, 1
	sub $t0, $t0, $s0
	add $s3, $s3, $t0
	
	li $t1, 2
	blt $s0, $t1, postIf

	move $a0, $s0
	move $a1, $s1
	jal remove
	
	move $s1, $v0
postIf:
	addi $s0, $s0, 1
	addi $s4, $s4, 1
	j for
postFor:
	move $v0, $s3

	# restore original values in s & ra registers
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $s3, 12($sp)
	lw $s4, 16($sp)
	lw $ra, 20($sp)
	addiu $sp, $sp, 24

	jr $ra
    
main:  # DO NOT MODIFY THE MAIN SECTION
    li $a0, 4
    li $a1, 10
    li $a2, 3

    jal calc

    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 10
    syscall
