# Somma degli elementi di posizione pari, meno la somma degli elementi diposizione dispari
# il risultato dovrebbe essere -11 (3,-4,-1,4)-(2,6,5)
.data
	v: .word 3,2,-4,6,-1,5,4
	n: .word 7 
.text
	la $s0, v
	lw $t0, n
	
loop:	lw $t1, 0($s0)
	add $s1, $s1, $t1
	addi $t0, $t0, -1
	beq $t0, 0, exit
	lw $t2, 4($s0)
	add $s2, $s2, $t2
	addi $s0, $s0, 8
	addi $t0, $t0, -1
	bne $t0, $0, loop
	
exit:   sub $a0, $s1, $s2
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	
	
	
