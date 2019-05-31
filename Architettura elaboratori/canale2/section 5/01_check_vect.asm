# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Scrivere un programma in linguaggio assembly MIPS che riceve in ingresso 
# una sequenza di N numeri interi. I numeri sono memorizzati in un vettore. 
# Il valore N è inserito dall’utente, ma il vettore può contenere al massimo 30 numeri.
# Terminato l'inserimento della sequenza di numeri, il programma deve veri�?care se 
# gli elementi del vettore sono tutti uguali tra loro.

.globl main 

.data
	arr: .space 120     												    											# Array contenente gli interi passati in input (max 120 = 30elementi * 4byte)
	max: .word 30 																									# Massimo di elementi memorizzabili in arr
	err: .asciiz "Il vettore non puo' contenere piu' di 30 elementi.."   			# Messaggio di errore
	start: .asciiz "Inserire il numero di elementi da immettere: "      			# Messaggio di inizio
	y: .asciiz "Tutti gli elementi sono uguali tra di loro"									# Stato finale positivo
	n: .asciiz "Gli elementi non sono tutti uguali"												# Stato finale negativo
	

.eqv $curr, $t0				# Valore corrente in esame
.eqv $prev, $t1				# Valore precendentemente esaminato
.eqv $idx, $t2				# Indice per lo scorrimento del vettore
.eqv $lim, $t3				# Elementi da inserire
.eqv $stat, $t4				# 0 se elementi diversi, 1 se tutti uguali 

.text
main:
	la $a0, start
	li $v0, 4
	syscall 				# Stampa a video il messaggio di inizio
	
	li $v0,5				# Legge il numero che  indica il numero di interi da inserire
	syscall
	lw $lim, max			
	bgt $v0, $lim, error
	move $lim, $v0
	li $stat, 1             # Assume che tutti i numeri siano uguali all'inizio
	
	li $v0,5
	syscall					# Legge il primo elemento del vettore
	
	sw $v0, arr($zero)		# Salva nell'array il primo vettore
	move $prev,$v0 			# Imposta il valore come precedente
	li $idx, 1  			# Inizializza il contatore ad 1, escludendo così il primo elemento già letto
	
for:
	beq $idx, $lim, end		# Comincia il ciclo dal secondo elemento
	li $v0,5
	syscall					# Legge intero da input
	
	move $curr, $v0			# Salva il numero corrente
	
	
	sll $t5, $idx, 2
	sw $v0, arr($t5)		# Salva il valore nell'array
	addi $idx, $idx, 1
	
	beq $stat, 1, check     # Se lo stato è uno verifica che curr e prec siano uguali, se e' 0 non serve il controllo
	
	j for

end:
	beq $stat, $zero, neq

eq:							# Se gli elementi sono tutti uguali carica il messaggio in y
	la $a0, y
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
	

neq:						# Se gli elementi NON sono tutti uguali tra loro carica il messaggio in n
	la $a0, n
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
		
error:
	la $a0, err
	li $v0, 4
	syscall 				# Stampa messaggio di errore
	j main
	
check:
	seq $stat, $prev, $curr # Se i numeri sono uguali mantiene 1 altrimenti 0 (la funzione viene eseguita solo se $stat=1)
	move $prev, $curr       # Il numero esaminato diventa il precedente
	j for
	
