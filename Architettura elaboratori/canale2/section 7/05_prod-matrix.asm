# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# DA SVOLGERE

#Definita una matrice in memoria di 8 righe e 8 colonne con elementi halfword, A8x8, stampare in output una nuova matrice B8x4 in cui le colonne sono date 
# dal prodotto degli elementi delle colonne della matrice originaria: 
# cioè B4x8 
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
# 0000 0421 0001 0008
# 0044 0000 0000 0000
# 1500 0340 0000 0052
# 0630 0064 0006 0015
# 0020 0000 0000 0012
# 0000 0028 0000 0000

.globl main

.data
	M: .half 02 04 06 07 00 12 03 08 01 10 05 16 00 01 01 10 00 03 20 21 01 01 02 04 02 22 06 00 00 12 37 00 30 50 01 34 00 05 04 13 10 63 08 08 01 06 05 03 05 04 00 01 00 09 06 02 41 00 14 02 00 14 00 01
	R: .word 8
	C1: .word 8
	C2: .word 4

.eqv $R, $t0
.eqv $C1, $t1
.eqv $C2, $t2
.eqv $i, $t3
.eqv $j, $t4
.eqv $idx, $t5

.text
main:
	li $i, 1
	li $j, 1
	lw $R, R
	lw $C1, C1
	lw $C2, C2
	
	for_riga:
		bgt $i, $R, end
		for_colonna:
			bgt $j, $C1, new_row
			
			#Calcolo indice matrice C * (r-1) + (c-1)
			subi $idx, $i, 1
			mul $idx, $idx, $C1
			subi $t9, $j, 1
			add $idx, $idx, $t9
			sll $idx, $idx, 1
			
			lh $a0, M($idx)
			li $v0, 1
			syscall
			
			li $a0, ' '
			li $v0, 11
			syscall
			
			addi $j, $j, 1
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
		