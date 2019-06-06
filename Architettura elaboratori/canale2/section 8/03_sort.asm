# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# NON FUNZIONA	

# Si scriva un programma in assembler che mediante la subroutine ORDINA ordina un vettore immesso da input. 
# La routine ORDINA ha come argomento il vettore (cioe' l'indirizzo del vettore), e restituisce il vettore ordinato 
# (l'indrizzo del vettore, con gli elementi ordinati).
# Ad esempio
# v=(1,10,6,3,2,4)
# ORDINA(v)=(1,2,3,4,6,10) 

.globl main

.data	
	inp: .word 0:6							# Inizializza un array di 6 elementi con valore 0 (vettore non ordinato)
	out: .word 0:6							# Vettore di output ordinato	
	
.eqv $idx, $t0								# Indice (usato per il vettore in input)
.eqv $start, $t1							# Indice (usato per il vettore di output)
.eqv $max, $t2								# Numero elementi nei vettori
.eqv $offs, $t3								# Usato per il calcolo dell'offset	
.eqv $min, $t4								# Elemento minimo

.text
main:
	li $max, 6								# Capacita' massima del vettore
	move $idx, $zero						# Inizializzazione dell'indice (vettore input)
	move $start, $zero				   		# Inizializzazione dell'indice (vettore output)
	li $min,  500							# Il numero piu' grande rappresentabile da una word
	
# Serve a  salvare il vettore messo in input
save_vect:
	bge $idx, $max, ORDINA
	
	li $v0, 5
	syscall									# Legge l'elemento
	
	sll $offs, $idx, 2 						# Calcolo dell'offset
	sw $v0, inp($offs)						# Salvo l'elemento
	addi $idx, $idx, 1						# Incremento del contatore
	j save_vect

end: 
# --------------------- START PRINT TEST ---------------------
	move $start, $zero	
print:
	sll $offs, $start, 2
	lw $a0, out($offs)
	li $v0, 1
	syscall
	addi $start, $start, 1
	blt $start, $max , print
# ---------------------- END PRINT TEST ----------------------
	la $v1, out								# indirizzo del vettore di output
	li $v0, 10
	syscall	
			
ORDINA:
	bge $start, $max, end					# Se abbiamo finito di scorrere il vettore di output
	move $idx, $start						# Copia l'indice

	jal find_min
	
	sll $offs, $start, 2					# Calcolo dell'offset per il vettore di output 
	sw $min, out($offs)						# Salva il valore nella posizione corretta
	addi $start, $start,1					# Incremento contatore
	li $min, 500							# Resetta il minimo (con il numero piu' grande rappresentabile da una word)
	j ORDINA
	
find_min:
	bge $idx, $max, return
	sll $offs, $idx, 2						# Calcolo dell'offset per il vettore di input
	lw $t7, inp($offs)						# Caricamento elemento dall'array non ordinato
	addi $idx, $idx,1
	blt $t7, $min, swap						# Abbiamo trovato il nuovo minimo?
	j find_min
swap:
	move $min, $t7
	j find_min 
return:
	jr $ra
	