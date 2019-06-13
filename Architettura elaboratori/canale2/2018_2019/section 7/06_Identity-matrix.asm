# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Definita una matrice in memoria di N righe e N colonne con elementi halfword, A(NxN), stampare in output il messaggio 
# con la scritta IDENTITA' se la matrice + la matrice identita' o NON IDENTITA' altrimenti. 
# Una matrice identita' e' una matrice costituita da elementi 0 eccetto quelli sulla diagonale principale che hanno valore 1
# ESEMPIO

# A
# 1 0 0
# 0 1 0
# 0 0 1

# OUTPUT: IDENTITA'

# ESEMPIO
# A
# 1 0 0
# 0 1 0
# 1 0 1

# OUTPUT: NON IDENTITA'

.globl main

.data
	#M: .half 1 0 0 0 1 0 0 0 1
	M: .half 1 0 0 0 1 0 1 0 1
	N: .word 3
	vero: .asciiz "IDENTITA'"
	falso: .asciiz "NON IDENTITA'"

.eqv $N, $t0							# Numero di  righe/colonne
.eqv $i, $t1							# Indice righe
.eqv $j, $t2							# Indice colonne
.eqv $idx, $t3							# Indice matrice
.eqv $el, $t4							# Elemento della matrice
.eqv $diagonale, $t5					# Indicatore di diagonale

.text
main:
	li $i, 1							# Inizializzo l'indice delle righe
	li $j, 1							# Inizializzo l'indice delle colonne
	lw $N, N							# Carico il numero di colonne/righe
	
	for_riga:
		bgt $i, $N, yes
		for_colonna:
			bgt $j, $N, new_row
			
			#Calcolo indice matrice C * (riga-1) + (colonna-1)
			subi $idx, $i, 1
			mul $idx, $idx, $N
			subi $t9, $j, 1
			add $idx, $idx, $t9
			sll $idx, $idx, 1
			
			lh $el, M($idx)							# Caricamento elemento dalla matrice
			seq $diagonale, $i, $j					# 1 se siamo sulla diagonale, 0 altrimenti
			addi $j, $j, 1							# Incrementa il contatore
			
			bnez $diagonale, check				# Salta se siamo sulla diagonale e andiamo a controllare l'elemento
			
			#Se arriviamo fino a qui non siamo sulla diagonale, se l'elemento non e' uguale a zero l'identita' non e' rispettata
			bnez $el, no
			
			j for_colonna
		
		new_row:
			addi $i, $i, 1									# Aggiorno il contatore della riga
			li $j, 1											# Resetto il contatore della colonna
			j for_riga
			
end:
	li $v0,10
	syscall		

# Siamo sulla diagonale, controlliamo il valore dell'elemento
check:
	beqz $el, no
	j for_colonna

# Messaggio se l'identita' e' rispettata		
yes:
	la $a0, vero
	li $v0, 4
	syscall
	
	j end

# Messaggio se l'identita' non e' rispettata
no:
	la $a0, falso
	li $v0, 4
	syscall
	
	j end
