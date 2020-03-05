# Scrivere a video la posizione del primo zero in un vettore, in caso non ci siano zeri va stampato -1
.data
	x: .word 0, 7, 5, -2, 1, 4, 0, 5	# Array di interi
	n: .word 8			# Numero di valori presenti nell'array

.text
	la $s0, x	# lui + ori per inserire il vettore nel registro $s0
	lw $t0, n	# inserimento del puntatore dell'array nel registro $t0
	li $s1, 1	# inizializzazione a 1 del registro $s1 come contatore
	loop: 
	lw $t2, 0($s0)	# inserimento nel registro $t2 del primo valore del vettore in $s0
	bne $t2, $zero, skip	# se $t2 è diverso da zero allora procedi all'etichetta skip:
	move $a0, $s1		# altrimenti sposta il valore del contatore nel registro $a0 per l'output
	beq $zero, $zero, exit
	skip: 
	addi $t0, $t0, -1	# decremento del puntatore $t0
	addi $s0, $s0, 4	# incremento di una word per spostarsi nel vettore
	addi $s1, $s1, 1	# aggiungi 1 al contatore $s1
	bne $t0, $zero, loop	# se $t0 è diverso da zero allora torna all'etichetta loop:
	li $a0, -1		# altrimenti inserisce -1 nel registro $a0 per l'output
	exit:	
	li $v0, 1		# output del valore intero presente in $a0
	syscall
	li $v0, 10		# termine del programma
	syscall
