# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Un programma in assembly MARS deve leggere dall'utente due vettori di 5 numeri interi ciascuno. 
# Il programma deve creare un ulteriore vettore, che contenga la copia dei soli elementi pari presenti 
# nei due vettori di partenza, e stampare tale vettore.

.globl main 

.data
	init: .space 20 		# Vettore di massimo 5 elementi
	res: .space 20			# Vettore risultato
	first: .asciiz "Immissione interi per il primo vettore:\n"
	second: .asciiz "Immissione interi per il secondo vettore:\n" 
	inters: .asciiz "Numeri pari in comune:\n"

.eqv $i, $t0 			# Indice primario
.eqv $j, $t1			# Indice secondario
.eqv $idx, $t2			# Indice per offset
.eqv $el, $t3			# Elemento attualmente preso in esame
.eqv $odd, $t4			# Verifica se l'elemento è pari o dispari
.eqv $two, $t5			# Costante 2
.eqv $vel, $t6			# Valore di un elemento del vettore
.eqv $vect, $t7			# Contiene uno dei due vettori


.text
main:
	move $i, $zero		# Inizializzazione indice
	move $j, $zero		# Inizializzazione indice
	
	li $two, 2
	la $vect, res			# Contiene l'indirizzo del vettore contenente i risultati 
	
	la $a0, first
	li $v0,4
	syscall				# Stampa prima stringa 

store:
	bge $i, 5, continue
	
	li $v0, 5
	syscall 				# Legge intero da input
	
	sll $idx, $i, 2			# Indice con offset per accedere al vettore
	sw $v0, init($idx) 		# Salva il primo vettore immesso
	
	addi $i, $i, 1
	j store	

continue:
	la $a0, second
	li $v0,4
	syscall				# Stampa seconda stringa 
	
	move $i, $zero			# Reset del contatore

check:
	beq $i, 5, print	
	
	li $v0, 5
	syscall 			# Legge input del secondo vettore
	
	div $v0, $two
	
	mfhi $odd			# 0 di resto se il numero e' pari, altrimenti maggiore
	move $el, $v0			# Elemento in analisi
	addi $i, $i, 1			# Incremento del contatore
	bgt $odd, $zero, check		# Se l'elemento non e' pari non ci interessa
	j verify			# Se l'elemento e' pari allora verifichiamo che sia nel primo array
	
verify:
	beq $j, 5, check
	sll $idx, $j, 2			# Calcolo offset
	lw $vel, init($idx)     # Caricamento elemento del primo vettore
	addi $j, $j, 1			# Incremento del contatore
	bne $vel, $el, verify	
	# AGGIUNGERE CONTROLLO PER NON SALVARE DOPPIONI
	
	#----FINE PROVA
	
	sw $el, ($vect)			# Salva il valore nell'array dei risultati
	addi $vect, $vect, 4    	# Incremento del puntatore
	addi $s0, $s0, 1		# Numero degli elementi salvati 
	
	j check
	
print:
	move $i, $zero 			# Resetta il contatore
	la $a0, inters
	li $v0,4
	syscall				# Stampa stringa risultati
for:
	beq $i, $s0, end 
	sll $idx, $i, 2
	lw $a0, res($idx)
	
	
	li $v0, 1
	syscall				# Stampa i numeri in res
	
	li $a0, ' '
	li $v0, 11
	syscall
	
	addi $i, $i, 1
	
	j for
end:
	li $v0, 10
	syscall
	

	
