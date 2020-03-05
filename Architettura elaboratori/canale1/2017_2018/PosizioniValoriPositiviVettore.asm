# Stampa tutte le posizioni del vettore in cui il valore è positivo
# nel seguente caso deve essere stampato "123467" (manca il 5 perché c'è "-1")
.data
	v: .word 1,2,4,6,-1,5,4,7
	n: .word 7
.text
	la $s0, v		
	lw $t0, n		# contatore dimensione array
	li $s1, 0		# contatore posizione
loop:
	lw $t1, 0($s0)
	beq $t0, 0, exit
	addi $s0, $s0, 4
	addi $t0, $t0, -1
	addi $s1, $s1, 1
	slti $t2, $t1, 0 	# se $t1 è minore di 0 allora $t2 = 1
	beq $t2, 0, stamp
	bne $t0, 0, loop
	beq $zero, $zero, exit	
stamp:
	move $a0, $s1
	li $v0, 1
	syscall
	beq $zero, $zero, loop
exit:
	li $v0, 10
	syscall
	
	
	
	
	
	
	
	
	
	
