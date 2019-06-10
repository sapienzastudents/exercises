# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Si scriva un programma in linguaggio MIPS/MARS per calcolare il minimo comune multiplo (MCM) di due numeri 
# interi positivi immessi da tastiera. Stampare il MCM. Dati due numeri interi N1 e N2, 
# il minimo comune multiplo e' il piu' piccolo numero M che e' divisibile (con resto pari a zero) 
# sia per N1 che per N2.

# Suggerimento. Si considerino due numeri interi N1 e N2. Sia N1 piu' grande di N2. 
# Il MCM e' il primo multiplo di N1 che e' divisibile (con resto uguale a zero) per N2.

# NB: la stampa deve avvenire da console output del MARS 

.globl main

.data
	mex: .asciiz "Immettere numero: "

.eqv $first,$t0   					#Primo nummero immeso da tastiera
.eqv $second,$t1  					#Secondo nummero immeso da tastiera
.eqv $res, $t2    					#Risultato del mcm

.text
main:
	la $a0, mex
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $first, $v0
	
	la $t1, mex
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $second, $v0
	
	#Se $first e $second non sono uguali allora bisogna verificare se sono l'uno divisore dell'altro
	bne $first, $second, verify
	
	#Se $first e $second sono uguali allora il mcm e' il numero stesso!
	move $res, $first
	j end

#cerca il mcm
verify:
	#Controllo se $first e' divisibile $second
	div $first, $second
	mfhi $t3 								# Resto della divisione
	seq $t3,$t3,$zero 						# Se il resto della divisione e' zero 
	move $res, $first 						# Settaggio risultato 
	bnez $t3,end 
	
	#Controllo se $second e' divisibile per $first
	div $second, $first
	mfhi $t3 								# Resto della divisione
	seq $t3,$t3,$zero 						# Se il resto della divisione e' zero 
	move $res, $second 						# Settaggio risultato 
	bnez $t3,end 
	
	#Se sono giunto fino a qui i numeri sono diversi, quindi ottengo il mcm moltiplicandoli
	mult $first,$second
	mflo $res
	
end:
	move $a0, $res
	li $v0,1
	syscall
	
	li $v0,10
	syscall
