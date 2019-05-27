#Esercizio 5A.
#1) si realizzi la funzione conta_bit_uguali(X,Y) RICORSIVA che riceve due interi X ed Y maggiori di zero e ne calcola
#il numero di bit uguali nella stessa posizione come segue:
#conta_bit_uguali( X, Y ) = 0  se X=0 oppure Y=0   (solo quando XoY sono stati esaminati tutti)
#conta_bit_uguali( X, Y ) = conta_bit_uguali(X/2, Y/2) + 1 se (X and 1) = (Y and 1) (LSB uguale)
#conta_bit_uguali( X, Y ) = conta_bit_uguali(X/2, Y/2) altrimenti (LSB diverso)
#NOTA: gli zeri non significativi (nella parte alta del numero) non vengono confrontati

.data

X:	.word 1
Y:	.word 3

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
beqz $a0, caso_base
beqz $a1, caso_base

subi $sp, $sp, 4
sw $ra, 0($sp)

andi $s0, $a0, 1
andi $s1, $a1, 1

bne $s1, $s0, next
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
