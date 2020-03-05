.data
	x: .word 2
	
.text
	lw $a0, x
	jal f
	beq $zero, $zero, exit
f: 	
	bne $a0, $zero, ric
	li $v0, 1		# (addi $v0, $zero, 1)
	jr $ra
ric:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $a0, $a0, -1
	jal f
	add $v0, $v0, $v0
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
exit:
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
		
		
