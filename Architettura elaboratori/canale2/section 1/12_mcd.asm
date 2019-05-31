# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Si scriva un programma in linguaggio MIPS/MARS per calcolare il massimo comun divisore (MCD) di due numeri 
# interi positivi. Il MCD è deﬁnito come il massimo tra i divisori comuni ai due numeri. Stampare il MCD.

# Suggerimento. Si considerino due numeri interi N1 e N2. 
# Il MCD di N1 e N2 è il massimo tra i numeri che sono divisori (con resto uguale a zero) sia di N2 che di N1. 
# In particolare, si supponga che sia N1 minore di N2.

# Il MCD è il massimo tra i numeri compresi tra 1 e N1 che sono divisori (con resto uguale a zero) 
# sia di N1 che di N2. 

.globl main

.data
	mex: .asciiz "Inserire numero: "

.eqv $first, $t0	#Contiene il primo numero immesso dalla tastiera
.eqv $second, $t1   #Contiene il secondo numero immeso dalla tasiera
.eqv $res, $t2		#Risultato contenente il MCD
.eqv $idx, $t3

.text

main:
	#Legge i due numeri da tastiera dei quali bisogna trovare il MCD
	li $v0,5
	syscall
	move $first, $v0
	
	li $v0,5
	syscall
	move $second, $v0
	
	#Nel caso in cui i numeri siano uguali allora il numero stesso è il MCD
	move $res, $first
	beq $first,$second,end
	
swap:
	move $a0, $first
	move $idx, $second
	bgt $a0,$idx,calc
	
	move $t4,$a0
	move $a0,$idx
	move $idx,$t4
	j calc
	
end:
	move $a0,$res
	li $v0, 1
	syscall
	
	li $v0,10
	syscall

calc:
	div $a0,$idx
	mfhi $t4     #Resto della divisione
	
	bnez $t4,swap
	 
	
