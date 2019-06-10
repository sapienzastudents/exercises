# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolta da Alessio Giovannini

# Trasformare il programma nella Traccia 1 in una macro.
.globl main

.macro make_matrix
main:
	lw $t0, R	# Caricamento numero righe
	lw $t1, C	# Caricamento numero colonne
	li $t2, 1 	# Inizializzazione indice delle righe
	li $t3, 1 	# Inizializzazione indice delle colonne
	
	for_riga:
		bgt $t2, $t0, end
	
		for_colonna:
			bgt $t3, $t1, continue
			
			subi $t4, $t2, 1			#
			mul $t4, $t1, $t4			# Calcolo indice matrice
			subi $t8, $t3, 1				# C*(riga-1)+(colonna-1)
			add $t4, $t4, $t8			#
			
			sll $t5, $t4, 2			# Calcolo dell'offset
			lw $a0, M($t5)		
			li $v0, 1
			syscall						# Caricamento e stampa elemento
			
			addi $t3, $t3, 1				# Aggiornamento indice colonna
			j for_colonna
			
		continue:
			addi $t2, $t2, 1				# Aggiornamento indice riga
			li $t3, 1					# Reset indice colonna
			
			li $a0, '\n'
			li $v0, 11
			syscall						# Stampa andata a capo
			
			j for_riga

end:
.end_macro

.data
	M: .word 0:91
	R: .word 13
	C: .word 7

.text
main:
	make_matrix	
	
	li $v0, 10
	syscall
