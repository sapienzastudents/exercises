# Implementare un programma che legga da input un intero positivo a>2 (word) ed un intero positivo (word) b>1 
# e ne restituisca in output il prodotto (a x b) senza utilizzare l'istruzione mul.

# Esempio
# INPUT (a): 10
# INPUT (b): 5
# OUTPUT: 50

.globl main 


.data
	mex: .asciiz "Il primo numero deve essere maggiore di 2, il secondo maggiore di 1 \n"

.eqv $first, $t0
.eqv $second $t1

.text
main:
	li $v0,5
	syscall
	move $first, $v0
	
	li $v0,5
	syscall
	move $second, $v0
	
	ble $first,2,err 
	ble $second,1,err
	move $t2,$zero
	
repeat:
	beq $t2,$second,end
	add $first, $first, $first
	addi $t2,$t2,1
	j repeat
	
end:
	move $a0,$first
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	
err:
	la $a0,mex
	li $v0,4
	syscall
	j main