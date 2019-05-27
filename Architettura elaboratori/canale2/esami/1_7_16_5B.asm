#si realizzi la funzione conta_bit_diversi(X,Y) RICORSIVA che riceve due interi X ed Y maggiori di zero e ne calcola
#il numero di bit diversi nella stessa posizione come segue:
#conta_bit_diversi( X, Y ) = 0  se X=0 e Y=0  (solo quando XeY sono stati esaminati tutti)
#conta_bit_diversi( X, Y ) = conta_bit_diversi(X/2, Y/2) + [(X and 1) xor (Y and 1)] altrimenti

.data

X:	.word 44
Y:	.word 20

.text

lw $a0, X
lw $a1, Y


jal ricorsione

move $a0, $v0
li $v0, 1
syscall

li $v0, 10
syscall


ricorsione:
seq $t0, $a0, $zero
seq $t1, $a1, $zero
and $t2, $t0, $t1
bnez  $t2, caso_base

subi $sp, $sp, 4
sw $ra, 0($sp)

andi $s0, $a0, 1
andi $s1, $a1, 1

beq $s1, $s0, next
addi, $v0, $v0, 1

next:
srl $a0, $a0, 1
srl $a1, $a1, 1

jal ricorsione

lw $ra 0($sp)
addi $sp, $sp, 4
jr $ra

caso_base:
jr $ra
