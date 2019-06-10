# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini 

# Implementare un programma che definiti R (numero di righe) e C (numero di colonne) 
# rispettivamente in $t0 e $t1, 
# stampa in maniera leggibile e conforme alla struttura tabellare una matrice M(RxC) definita in memoria. 

.globl main

.data
	M: .word 0:91	# Matrice con 13 Righe e 7 colonne (13*7=91)
	C: .word 7		# Numero di colonne
	R: .word 13		# Numero di righe
	
.eqv $R,  $t0		# Numero righe	
.eqv $C,  $t1		# Numero colonne
.eqv $i,  $t2		# Riga i-esima 
.eqv $j,  $t3		# Colonna j-esima
.eqv $idx, $t4		# Indice della matrice calcolato dalla formula C*(riga-1)+(colonna-1)
.eqv $offs, $t5		# Offset per la matrice

.text
main:
	lw $R, R	# Caricamento numero righe
	lw $C, C	# Caricamento numero colonne
	li $i, 1 	# Inizializzazione indice delle righe
	li $j, 1 	# Inizializzazione indice delle colonne
	
	for_riga:
		bgt $i, $R, end
	
		for_colonna:
			bgt $j, $C, continue
			
			subi $idx, $i, 1				#
			mul $idx, $C, $idx		# Calcolo indice matrice
			subi $t8, $j, 1				# C*(riga-1)+(colonna-1)
			add $idx, $idx, $t8		#
			
			sll $offs, $idx, 2			# Calcolo dell'offset
			lw $a0, M($offs)		
			li $v0, 1
			syscall							# Caricamento e stampa elemento
			
			addi $j, $j, 1					# Aggiornamento indice colonna
			j for_colonna
			
		continue:
			addi $i, $i, 1				# Aggiornamento indice riga
			li $j, 1					# Reset indice colonna
			
			li $a0, '\n'
			li $v0, 11
			syscall						# Stampa andata a capo
			
			j for_riga

end:
	li $v0, 10
	syscall								# Fine del programma
	
