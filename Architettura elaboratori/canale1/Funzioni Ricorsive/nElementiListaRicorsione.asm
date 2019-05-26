# Liste in MIPS
# Funzione ricorsiva per il calcolo del numero di elementi
.data
	nodo1: .word 8, nodo2 	#contenuto del primo nodo e link al secondo
	nodo2: .word 15, nodo3
	nodo3: .word -4, 0	#contenuto del terzo nodo e link a nulla (0), in quanto la lista è terminata
	lista: .word nodo1	#indirizzo di memoria del primo 
	
.text
	lw $t0, lista
	lw $a0, 4($t0)
	jal f
	beq $zero, $zero, exit
f:
	bne $a0, $zero, ric
	li $v0, 1
	jr $ra
ric:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	lw $a0, 4($a0)
	jal f
	addi $v0, $v0, 1
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
exit:
	move $a0, $v0
	li $v0, 1		
	syscall			#output di un intero
	li $v0, 10
	syscall			#termine dell'esecuzione