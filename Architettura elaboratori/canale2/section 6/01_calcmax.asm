# Implementare in linguaggio assembly MIPS un programma che calcola il massimo tra N elementi immessi in input (la lettura termina quando si introduce 
# un numero negativo). 
# Utilizzare la sub-routine (funzione) MASSIMO che presi due elementi restituisce il massimo.
# Esempio
# INPUT:
# 45; 66; 34; 156; 233; 234; 56; 0 ; -11 ANALISI
# MASSIMONUM(45, 66, 34, 156,233,234,56,0,-11)=234
# MASSIMO(MASSIMO(MASSIMO(MASSIMO(MASSIMO(MASSIMO(MASSIMO(45,66),34),156),233),234),56),0)=234
# OUTPUT:
# 234

.globl main

.data
	max: .word
	mex: .asciiz "Immettere sequenza di numeri dei quali si vuole trovare il massimo:\n"

.eqv $idx, $t0							# Contatore che indica il numero di elementi del vettore
.eqv, $curr, $t1
.eqv $max, $t2							# Indica il numero massimo

.text
main:
	move $idx, $zero				# Inizializza il contatore
	move $max, $zero				# Inizializza il massimo
	la $a0, mex
	li $v0, 4
	syscall 									# Stampa la stringa

# la routine collect si occupa di salvare il vettore immesso sullo stack
collect:
	li $v0, 5
	syscall									# Leggi l'intero da input
	
	move $curr, $v0
	bltz $curr, loop					# Se il numero immesso è minore di zero terminare l'inserimento
	
	subi $sp, $sp, 4					# Alloca spazio nello stack
	sw $curr, ($sp)					# Salva il valore immesso sullo stack
	addi $idx, $idx, 1					# Incrementa il contatore del numero di elementi
	j collect								

loop:
	beqz $idx, end					# Se sono stati esaminati tutti gli elementi nello stack abbiamo finito
	lw $a0, ($sp)						# Carica l'elemento dalla cima dello stack
	addi $sp, $sp, 4					# Libera lo spazio
	subi $idx, $idx,1			 		# Decrementa il contatore
	jal Massimo							# Chiamata a subroutine per trovare il massimo
	j loop
	
Massimo: 
	blt $a0, $max, dont				# Se il valore è più piccolo del massimo non fare nulla
	move $max, $a0 					# Il valore esaminato nello stack è attualmente il maggiore
	jr $ra
	
dont:
	jr $ra

end:
	move $a0, $max
	li $v0,1
	syscall 									# Stampa il massimo
	
	li $v0, 10
	syscall 									# Fine del programma
