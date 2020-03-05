# Stampa il numero positivo più piccolo all'interno di un vettore
.data
	v: .word 3,2,-4,6,-1,5,4
	n: .word 7
.text
	la $s0, v		# caricamento dell'indirizzo del vettore
	lw $t0, n		# inizializzazione alla dimensione del vettore
	lw $t1, 0($s0)		# inserimento nel registro t1 del primo valore del vettore presente in $s0
skip:
	addi $s0, $s0, 4	# incremento dell'indirizzo del vettore per prendere il prossimo valore
	addi $t0, $t0, -1	# decremento dell'indice di dimensione del vettore
	bne $t0, $zero, loop	# continua il ciclo fino a che l'indice non arriva a 0 (ovvero a fine vettore)
	beq $zero, $zero, exit
loop:	
	lw $t2, 0($s0)		# inserimento nel registro t2 del secondo valore del vettore, per il confronto
	slti $t3, $t2, 0	# se $t1<0 allora $t3=1 else $t3=0
	bne $t3, $zero, skip	# se $t3!=0 allora vai a skip
	slt $t3, $t2, $t1	# altrimenti, se $t2<$t1 allora $t3=1 else $t3=0
	beq $t3, $zero, skip	# se $t3=0 allora vai a skip
	move $t1, $t2		# altrimenti, $t2 è il valore più piccolo, viene quindi messo in $t1
exit:
	move $a0, $t1		# scrivo in $a0 il valore minore presente nel vettore
	li $v0, 1		# output del valore intero presente in $a0
	syscall
	li $v0, 10		# chiusura del programma
	syscall
	
