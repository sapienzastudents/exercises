# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Si scriva un programma in linguaggio MIPS/MARS per calcolare il massimo comun divisore (MCD) di due numeri 
# interi positivi. Il MCD e' definito come il massimo tra i divisori comuni ai due numeri. Stampare il MCD.

# Suggerimento. Si considerino due numeri interi N1 e N2. 
# Il MCD di N1 e N2 e' il massimo tra i numeri che sono divisori (con resto uguale a zero) sia di N2 che di N1. 
# In particolare, si supponga che sia N1 minore di N2.

# Il MCD e' il massimo tra i numeri compresi tra 1 e N1 che sono divisori (con resto uguale a zero) 
# sia di N1 che di N2. 

.globl main

.data
	mex: .asciiz "Inserire numero: "

.eqv $first, $t0					# Contiene il primo numero immesso dalla tastiera
.eqv $second, $t1   			# Contiene il secondo numero immeso dalla tasiera
.eqv $res, $t2					# Risultato contenente il MCD
.eqv $idx, $t3					# Rappresenta il numero piu' piccolo


.text
main:
	# Legge i due numeri da tastiera dei quali bisogna trovare il MCD
	li $v0,5
	syscall
	move $first, $v0
	
	li $v0,5
	syscall
	move $second, $v0
	
	# Nel caso in cui i numeri siano uguali allora il numero stesso e' il MCD
	move $res, $first
	beq $first,$second,end
	
	bgt $first, $second, swap
	move $res, $first
	
swap:
	move $idx, $second
	
calc:
	div $first, $idx						
	mfhi $t7
	
	 div $second, $idx
	 mfhi $t6
	 
	  seq $t7, $t7, $zero		# Se è uguale a zero allora e' divisibile
	  seq $t6, $t6, $zero		# Se è uguale a zero allora e' divisibile
	  
	 move $res, $idx				# Salvo il risultato (se non e' corretto verra' cambiato al prossimo ciclo)
	 subi $idx, $idx, 1			# Decremento l'indice
	 
	 and $t7, $t7, $t6		   # Se è uguale a 1 entrambi sono divisibili per $idx
	 beqz $t7, calc			

end:  
	 move $a0, $res
	 li $v0, 1
	 syscall							  # Stampo il numero
	 
	 li $v0, 10
	 syscall	
	 
	
