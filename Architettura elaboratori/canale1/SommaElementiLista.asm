# Liste in MIPS
# Somma degli elementi di una lista
.data
	nodo1: .word 8, nodo2 	#contenuto del primo nodo e link al secondo
	nodo2: .word 15, nodo3
	nodo3: .word -4, 0	#contenuto del terzo nodo e link a nulla (0), in quanto la lista è terminata
	lista: .word nodo1	#indirizzo di memoria del primo nodo
	
.text
	li $s0, 0		#inizializzo variabile per la somma
	lw $t0, lista		#inizializzo $t0 con l'indirizzo di memoria di nodo1
loop:
	lw $t1, 0($t0)		#inizializzo $t1 con il contenuto del nodo
	add $s0, $s0, $t1	#aggiungo alla variabile il valore del nodo
	lw $t0, 4($t0)		#sovrascrivo l'indirizzo di memoria in $t0 con quello del prossimo nodo
	bne $t0, $zero, loop	#se l'indirizzo che dovrebbe essere in $t0 non è zero, allora la lista non è terminata
	move $a0, $s0		#se invece è 0, la lista è terminata e sposto il valore della somma in $a0 per l'output
	li $v0, 1		
	syscall			#output di un intero
	li $v0, 10
	syscall			#termine dell'esecuzione