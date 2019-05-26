# Implementare un programma che legga da input un intero positivo a>2 (word) ed un intero positivo (word) b>1 e 
# restituisca in output il quoziente e resto della divisione a/b.

# Esempio
# INPUT (a): 56
# INPUT (b): 23
# OUTPUT: Quoziente: 2 Resto:10

.globl main

.data
	quot: .asciiz "Quoziente: "
	rest: .asciiz ", Resto: "
	
.text
main:
	#---Legge gli input da tastiera e li memorizza in $t0 e $t1---
	li $v0,5
	syscall
	move $t0,$v0
	li $v0,5
	syscall
	move $t1,$v0
	
	div $t0,$t1 	#Effettua la divisione
	
	la $a0, quot
	li $v0, 4
	syscall
	
	mflo $a0 		#Preleva  il quoziente della divisione
	li $v0, 1
	syscall
	
	la $a0, rest
	li $v0, 4
	syscall
	
	mfhi $a0 		#Preleva  il resto della divisione
	li $v0, 1
	syscall
	
	li $v0,10
	syscall