# Svolto da Alessio Giovannini

# Data una matrice A(RxC) di elementi halfword, realizzare un programma, in linguaggio assembly MIPS,  
# che restituisca la somma degli elementi la cui somma degli indici e' multipla di 3;
# cioe' sommare tutti gli ai,j con  i+j multiplo di 3.
# ESEMPIO

# 1   0    7    5    1970
# 8   2    14   10   456
# 2   23   12   1974 15

# La matrice, il numero di righe R e il numero di colonne C sono definite  in  memoria;  
# il  risultato e' stampato  a  video  (mediante syscall). 
# Per l'inizializzazione della matrice e' possibile utilizzare l'esempio. 
# NB: Il programma deve essere valido per ogni matrice di dimensione RxC variabile

.globl main

.data
	M: .half 1 0 7 5 1970 8 2 14 10 456 2 23 12 1974 15
	R: .word 3
	C: .word 5
	
.eqv $i, $t0
.eqv $j, $t1
.eqv $C, $t2
.eqv $R, $t3
.eqv $el, $t4	
.eqv $sum, $t5
.eqv $idx, $t6
	
.text
main:
	li $i 1
	li $j 1
    move $sum, $zero
	lw $R, R
	lw $C, C
	
	for_riga:
		bgt $i, $R, end
		for_colonna:
			bgt $j, $C, new_row
			
			#Calcolo indice matrice C * (r-1) + (c-1)
			subi $idx, $i, 1
			mul $idx, $idx, $C
			subi $t9, $j, 1
			add $idx, $idx, $t9
			sll $idx, $idx, 1
			
			lh $el, M($idx)								# Caricamento elemento dalla matrice

		# Verifica che i+j e' un multiplo di 3
		li $t8, 3
		add $t9, $i, $j
		
		div $t9, $t8
		mfhi $t9										# Preleva il resto della divisione
		addi $j, $j, 1									# Incremento contatore colonna
		bnez $t9, for_colonna					# Se non e' zero non e' multiplo di 3
				
		add $sum, $sum, $el					# Incremento la somma
		
		j for_colonna
		
	new_row:
		addi $i, $i, 1			# Incremento contatore righe
		li $j, 1
		j for_riga

end:
	move $a0, $sum
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
