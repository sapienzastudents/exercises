# Implementare un programma che dati cinque interi positivi definiti in memoria ne calcoli la media aritmetica

# Esempio
# INPUT: a=0,b=11;c=7;d=1982;e=10051980
# OUTPUT:2010796

.globl main

.data
	idx: .word 5 
	a: .word 0
	b: .word 11
	c: .word 7
	d: .word 1982
	e: .word 10051980

.eqv $sum,$t0	
.eqv $start,$t1

.text
main:
	move $sum, $zero
	
	lw $t1,a
	add $sum,$sum,$t1 
	
	lw $t1,b
	add $sum,$sum,$t1
	
	lw $t1,c
	add $sum,$sum,$t1
	
	lw $t1,d
	add $sum,$sum,$t1
	
	lw $t1,e
	add $sum,$sum,$t1
	
	lw $t1,idx
	
	div $sum,$t1
	
	mflo $a0
	li $v0,1
	syscall
	
	li $v0,10
	syscall