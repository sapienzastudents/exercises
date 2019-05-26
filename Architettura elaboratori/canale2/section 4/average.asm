# Traccia 1 Leggere 7 valori interi da input e calcolarne la media (stampandola a video).

# INPUT
# 12;82;11;2345;67;123456;675

# OUTPUT
# 126069.428571428

# NB: La media deve essere espressa con un numero reale (float). Utilizzare il coprocessore matematico. 

.globl main

.data
	N: .word 7

.eqv $sum,$t1
.eqv $max $t2

.text
main:
	move $t0,$zero
	li $sum, 0
	lw $max, N
	
scan:
	beq $t0,$max,end
	addi $t0,$t0,1
	
	li $v0,5
	syscall
	
	add $sum,$sum,$v0
	j scan

end:
	