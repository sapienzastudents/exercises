# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Definita una matrice in memoria di 4 righe e 3 colonne A 4x3 con elementi word, stampare in output la matrice trasposta B 3x4. 
# La matrice trasposta B costituita dagli elementi alla posizione inversa della matrice originale A:
# cioe' A(ai,j) si trova in B(aj,i)

# ESEMPIO
# A (input)
# 12 74 06 07
# 99 10 11 16
# 00 03 20 21

# B (output)
# 12 99 00
# 74 10 03
# 06 11 20
# 07 16 21  

.globl main

.data
	A: .word 12, 74, 06, 07, 99, 10, 11, 16, 00, 03, 20, 21		# Matrice originale
	C: 4														# Numero di colonne
	R: 3													    # Numero di righe

.eqv $C, $t0									# Numero di colonne
.eqv $R, $t1									# Numero di righe
.eqv $i, $t2									# Indice righe
.eqv $j, $t3									# Indice colonne
.eqv $idx, $t4									# Indice matrice
.eqv $count, $t5								# Contatore per andata a capo							
	
.text
main:
	lw $C, C									# Numero di colonne
	lw $R, R									# Numero di righe
	li $i, 1									# Indice righe
	li $j 1										# Indice colonne

	for_riga:
		bgt $i, $C, end
		for_colonna:
		bgt $j, $R, next_row
		
		# Calcolo dell'indice della matrice transposta C * (c-1) + (r-1)
		subi $idx, $j, 1		
		mul $idx, $idx, $C
		subi $t9, $i, 1
		add $idx, $idx, $t9 
		sll $idx, $idx, 2					# Calcolo dell'offset
		
		lw $a0, A($idx)					# Caricamento elemento dalla matrice originale
		li $v0, 1
		syscall									# Stampa elemento
		
		li $a0, ' '
		li $v0, 11
		syscall									# Stampa spazio tra elementi
		
		addi $j, $j, 1							# Incremento contatore colonna
		addi $count, $count, 1
		beq $count, $R, cr				# Se j uguale alla riga bisogna andare a capo
		j for_colonna
		
	next_row:
		addi $i, $i, 1							# Aggiornamento contatore riga
		li $j, 1									# Reset del contatore colonna
		j for_riga

end:
	li $v0, 10
	syscall										# Fine del programma

#Carriage return (andata a capo)
cr:	
	li $a0, '\n'
	li $v0, 11
	syscall										# Stampo andata a capo
	
	li $count, 0								# Resetto il contatore
	
	j for_colonna