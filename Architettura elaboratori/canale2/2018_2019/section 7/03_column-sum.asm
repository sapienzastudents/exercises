# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Definita in memoria una matrice di 4 righe e 4 colonne con elementi byte, stampare in output 
# la somma degli elementi prensenti lungo una colonna ESEMPIO:
# MEMORIA
# 3 6  7 8
# 1 5  2 0
# 6 8 10 5
# 4 1 -9 2

# OUTPUT
# COLONNA 1: 14
# COLONNA 2: 20
# COLONNA 3: 10
# COLONNA 4: 15

.globl main 

.data
	M: .byte 3, 6, 7, 8, 1, 5, 2, 0, 6, 8, 10, 5, 4, 1, -9, 2
	R: .byte 4
	C: .byte 4
	coln: .asciiz "COLONNA "
	spc: .asciiz ": "

.macro carriage_return
	li $a0, '\n'
	li $v0, 11
	syscall
.end_macro

.macro space
	la $a0, spc
	li $a1, 2
	li $v0, 4
	syscall
.end_macro

.eqv $R, $t0 						# Numero di righe
.eqv $C, $t1						# Numero di colonne
.eqv $i, $t2						# Riga i-esima
.eqv $j, $t3						# Colonna j-esima
.eqv $idx, $t4						# Indice della matrice
.eqv $el, $t5						# Elemento della matrice in esame
.eqv $sum, $t6						# Somma colonna
		
			
.text
main:
	lb $C, C						# Carica valore del totale di colonne
	lb $R, R						# Carica valore del totale di righe
	li $i,1							# Inizializza riga
	li $j,1							# Inizializza colonna
	move $sum, $zero				# Inizializza variabile di somma colonne
	
for:
	bgt $j, $C, end					# Se abbiamo terminato le colonne il processo e' terminato
	bgt $i, $R, reset				# Se abbiamo analizzato tutte le righe ricominciamo da capo con la prossima colonna

	subi $idx, $i, 1				#
	mul $idx, $idx, $C				# Calcolo indice matrice
	subi $t9, $j, 1					# C * (riga-1)+(colonna-1)
	add $idx, $idx, $t9				#
	
	lb $el, M($idx)
	add $sum, $sum, $el				# Incremento della somma
	addi $i, $i, 1					# Incremento della riga
	j for
	
reset:
	la $a0, coln					#
	li $v0, 4						#
	syscall							# Stampa l'indicatore di colonna
	move $a0, $j					#
	li $v0, 1						#
	syscall							#
	
	space							# Chiamata alla macro che stampa uno spazio
	
	move $a0, $sum
	li $v0, 1
	syscall							# Stampa del valore
	
	carriage_return					# Chiamata alla macro che stampa l'andata a capo
	
	move $sum, $zero				# Resetta la somma delle colonne 
	li $i, 1						# Resetta l'indice delle righe
	addi $j, $j, 1					# Passa alla colonna successiva
	j for
	
end:
	li $v0, 10
	syscall
