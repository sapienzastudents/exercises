# Un utente introduce da tastiera due numeri interi (INIT e LUNG). Il programma MIPS/MARS deve stampare 
# una serie di numeri interi consecutivi. La serie inizia al valore INIT ed è lunga LUN elementi.

# Esempio:
# INPUT:
# 7
# 4

# OUTPUT: 7 8 9 10

.globl main

.data
	space: .asciiz " "
	INIT: .asciiz "Insert INIT: "
	LUNG: .asciiz "Insert LUNG: "

.eqv $init,$t0
.eqv $lung,$t1

.text

main:
	la $a0,INIT
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $init, $v0
	
	la $a0,LUNG
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $lung, $v0
	
	li $t3,0

repeat:
	beq $t3,$lung,end
	addi $t3,$t3,1  #incremento del contatore
	
	move $a0, $init
	li $v0,1
	syscall
	
	la $a0,space
	li $v0,4
	syscall
	
	addi $init,$init,1
	j repeat
	
end:
	li $v0,10
	syscall
	