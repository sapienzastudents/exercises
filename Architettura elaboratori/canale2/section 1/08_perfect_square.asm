# Si scriva un programma in linguaggio assembler MIPS/MARS per il calcolo dei quadrati perfetti per una sequenza
# di numeri. Il programma deve prima leggere un numero inserito da tastiera, e quindi stampare i primi quadrati 
# perfetti sino al quadrato del numero.

# ES:
# INPUT=5
# OUTPUT=1,4,9,16,25

.globl main

.data
	mex: .asciiz "Inserisci un numero: "
	res: .asciiz "Quadrati perfetti:\n"
	spaz: .asciiz ", "

.text

main:
	la $a0, mex
	li $v0,4
	syscall

	li $v0,5 
	syscall
	
	move $t1, $v0 		#Numero di quadrati perfetti da generare
	li $t0, 1
	
repeat:
	bgt $t0, $t1, end 
	mul $a0,$t0,$t0
	
	li $v0, 1
	syscall
	
	la $a0, spaz
	li $v0, 4
	syscall 
	
	addi $t0, $t0, 1
	j repeat
	
end:
	li $v0,10
	syscall
