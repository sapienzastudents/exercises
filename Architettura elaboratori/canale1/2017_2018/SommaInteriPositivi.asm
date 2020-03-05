# Somma degli interi positivi in un vettore, ignorando quelli negativi
.data
	v: 1,2,-4,6,-1,5,4
	n: 7
.text
	la $s0, v		# caricamento dell'indirizzo del vettore
	lw $t0, n		# inizializzazione alla dimensione del vettore
	li $s1, 0		# inizializzazione a 0 del registro $s1 come contatore
loop:
	lw $t1, 0($s0)
	slti $t2, $t1, 0
	bne $t2, $zero, skip
	add $s1, $s1, $t1 
skip:
	addi $s0, $s0, 4
	addi $t0, $t0, -1
	bne $t0, $zero, loop
exit:
	move $a0, $s1
	li $v0, 1
	syscall
	li $v0, 10
	syscall
