# Alberi in MIPS
# Numero di nodi in un albero
.data
	nodo1: .word 6, nodo2
	nodo2: .word 5, 0, nodo3
	nodo3: .word 4, nodo5, nodo4
	nodo4: .word 13, 0, 0
	nodo5: .word 3, nodo10, nodo6
	nodo6: .word 2, 0, nodo7
	nodo7: .word 7, 0, nodo8
	nodo8: .word 1, 0, nodo9
	nodo9: .word 4, 0, 0
	nodo10: .word 19, 0, nodo11
	nodo11: .word 20, 0 , 0
	tree: .word nodo1
	
.text
	lw $a0, tree
	lw $s0, 4($a0)
	jal albero
	move $a0,$v0
	li $v0,1
	syscall
	li $v0,10
	syscall
albero:
	bne $s0, $zero, ric
	li $v0, 0
	jr $ra
ric:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	lw $a0, 4($a0)	
	jal foresta
	addi $v0, $v0, 1
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra	
foresta:
	bne $a0, $zero, ric2
	li $v0, 0
	jr $ra
ric2:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	jal albero
	sw $v0, 8($sp)
	lw $a0, 4($sp)
	lw $a0, 8($a0)
	jal foresta
	lw $t0,8($sp)
	add $v0,$v0,$t0
	lw $ra, 0($sp)
	addi $sp, $sp, 12
	jr $ra
