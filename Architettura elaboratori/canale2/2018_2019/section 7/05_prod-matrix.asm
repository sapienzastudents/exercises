# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Definita una matrice in memoria di 8 righe e 8 colonne con elementi halfword, A8x8, stampare in output una nuova matrice B8x4 
# in cui le colonne sono date dal prodotto degli elementi delle colonne della matrice originaria: 
# cioe' B4x8 
# b1,1=a1,1*a1,2; 
# b1,2=a1,3*a1,4; 
# b1,3=a1,5*a1,6;
# b1,4=a1,7*a1,8.

#ESEMPIO
#A
# 02 04 06 07 00 12 03 08
# 01 10 05 16 00 01 01 10
# 00 03 20 21 01 01 02 04
# 02 22 06 00 00 12 37 00
# 30 50 01 34 00 05 04 13
# 10 63 08 08 01 06 05 03
# 05 04 00 01 00 09 06 02
# 41 00 14 02 00 14 00 01

# B
# 0008 0042 0000 0024
# 0010 0080 0000 0010
# 0000 0420 0001 0008
# 0044 0000 0000 0000
# 1500 0034 0000 0052
# 0630 0064 0006 0015
# 0020 0000 0000 0012
# 0000 0028 0000 0000

.globl main

.data
	M: .half 02 04 06 07 00 12 03 08 01 10 05 16 00 01 01 10 00 03 20 21 01 01 02 04 02 22 06 00 00 12 37 00 30 50 01 34 00 05 04 13 10 63 08 08 01 06 05 03 05 04 00 01 00 09 06 02 41 00 14 02 00 14 00 01
	R: .word 8
	C: .word 8

.eqv $R, $t0							# Numero delle righe
.eqv $C, $t1							# Numero delle colonne
.eqv $i, $t2							# Indice righe
.eqv $j, $t3							# Indice colonne
.eqv $idx, $t4							# Indice matrice

.macro calc_idx
#Calcolo indice matrice C * (r-1) + (c-1)
	subi $idx, $i, 1
	mul $idx, $idx, $C
	subi $t9, $j, 1
	add $idx, $idx, $t9
	sll $idx, $idx, 1
.end_macro

.text
main:
	li $i, 1
	li $j, 1
	lw $R, R
	lw $C, C
	
	for_riga:
		bgt $i, $R, end
		for_colonna:
			bgt $j, $C, new_row
			
			calc_idx						# Calcolo primo indice  (chiamata alla macro)
			addi $j, $j, 1					# Incremento contatore
			
			lh $t8, M($idx)					# Caricamento elemento 
			
			calc_idx						# Calcolo del secondo indice (chiamata alla macro)
			
			lh $a0, M($idx)		
			mul $a0, $a0, $t8				# calcolo del risultato
			li $v0, 1
			syscall
			
			li $a0, ' '
			li $v0, 11
			syscall
			
			addi $j, $j, 1					# incremento del contatore
			j for_colonna
		
		new_row:
			li $a0, '\n'
			li $v0, 11
			syscall
		
			addi $i, $i, 1
			li $j, 1
			j for_riga
			
end:
	li $v0,10
	syscall		
		
