# Stampa la somma degli elementi di v strettamente più piccoli di x
# assumo che il vettore contenga almeno 1 valore
.data
	# con i valori 3,2,4,6,-1,5,4 strettamente più piccoli di 4, la somma degli elementi sarà 4
        v: .word 3,2,4,6,-1,5,4
        n: .word 7
        x: .word 4
.text
        la $s0, v
        lw $s1, n
        lw $s2, x
loop:
        lw $t0, 0($s0)
        addi $s0, $s0, 4
        addi $s1, $s1, -1
        slt $t1, $t0, $s2               # se $t0 < $s2 allora $t1 = 1
        beq $t1, 1, sum
        bne $s1, 0, loop
        beq $s1, 0, exit
sum:
        add $s3, $s3, $t0
        bne $s1, 0, loop
exit:
        move $a0, $s3
        li $v0, 1
        syscall
        li $v0, 10
        syscall