# Funzione ricorsiva per invertire una data lista

.data
	nodo1: .word 8, nodo2
	nodo2: .word 15, nodo3
	nodo3: .word -4, 0
	lista: .word nodo1
	
.text
	lw $s0, lista
	jal f
	beq $zero, $zero, exit
f:
	lw $t0, 4($s0)		# caso base in cui c'è un solo elemento in lista
	bne $t0, $zero, ric
	lw $a0, 0($s0)
	li $v0, 1
	syscall
	jr $ra
ric:
	addi $sp, $sp, -8	# prendo spazio per salvare due word nel registro sp
	sw $ra, 0($sp)		# salvo il contenuto di $ra per il ritorno nella prima word di $sp
	sw $s0, 4($sp)		# salvo l'indirizzo al nodo nel registro sp
	move $s0, $t0
	jal f
	lw $s0, 4($sp)
	lw $t0, 4($s0)
	sw $s0, 4($t0)
	sw $zero, 4($s0)
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	lw $a0, 0($s0)
	li $v0, 1
	syscall
	jr $ra
			
exit:
	li $v0, 10
	syscall
	
