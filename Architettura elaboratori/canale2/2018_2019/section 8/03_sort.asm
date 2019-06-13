# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini
# PS (ho utilizzato l'approccio Selection Sort per ordinare)	

# Si scriva un programma in assembler che mediante la subroutine ORDINA ordina un vettore immesso da input. 
# La routine ORDINA ha come argomento il vettore (cioe' l'indirizzo del vettore), e restituisce il vettore ordinato 
# (l'indrizzo del vettore, con gli elementi ordinati).
# Ad esempio
# v=(1,10,6,3,2,4)
# ORDINA(v)=(1,2,3,4,6,10) 

.globl main

.data	
	inp: .word 0:6					# Inizializza un array di 6 elementi con valore 0

.eqv $idx, $t0						# Indice primario
.eqv $offs, $t1						# Offset primario
.eqv $inn, $t2						# Indice secondario
.eqv $pos, $t3						# Offset secondario
.eqv $min, $t4						# Rappresenta il minimo
.eqv $now, $t5						# Rappresenta elemento in esame del ciclo principale
.eqv $curr, $t6						# Elemento corrente del ciclo innestato	


.text
main:
	user_inp:
	bge $idx, 6, ORDINA				# Condizione del ciclo
	
	li $v0, 5			
	syscall							# Leggo input da tastiera
	
	sll $offs, $idx, 2				# Calcolo dell'offset per il vettore
	sw $v0, inp($offs)				# Salvataggio del valore letto nell'array
	addi $idx, $idx, 1				# Incremento del contatore
	j user_inp

ORDINA:
	move $idx, $zero				# Resetta il contatore
	move $inn, $idx					# Imposta il ciclo interno
	
	set:
		bge $idx, 5, print				
	
		sll $offs, $idx, 2				# Calcolo l'offset del indice primario
		lw $now, inp($offs)				# Elemento indice primario
		move $min, $now					# Impostazione del minimo
		addi $idx, $idx, 1				# Incrementa contatore primario
		move $inn, $idx 				# Setto l'indice del ciclo innestato
	
	inner:
		bge $inn, 6, insert
		sll $t7, $inn, 2			# Calcolo offset ciclo interno 
		lw $curr, inp($t7)			# Caricamento elemento
		addi $inn, $inn, 1			# Incremento dell'indice del ciclo interno
		bge $curr, $min, inner		# Se il numero corrente non è il nuovo minimo ricomincia il ciclo
		
		move $pos, $t7				# Ci salviamo l'offset
		move $min, $curr			# l'elemento in esame è il nuovo minimo
		j inner
		
	insert:
		beq $now, $min, set			# Se l'elemento del primo ciclo è anche il minimo non fare nulla			
		
		sw $min, inp($offs)			# Sposta il minimo alla posizione esatta che verrà poi esclusa
		sw $now, inp($pos)
		
		j set

print:
	move $idx, $zero				# Inizializzazione dell'indice
	for:
		sll $offs, $idx, 2	
		lw $a0, inp($offs)
		
		li $v0, 1
		syscall						# Stampo intero
		
		addi $idx, $idx, 1			# Incremento il contatore
		blt $idx, 6, for
		
		li $v0, 10
		syscall 