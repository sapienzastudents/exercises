# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Confrontare due interi positivi a e b, definiti in memoria, e mettere in $t0 il valore 0 se a e' maggiore di b, 
# 1 altrimenti. Non e' possibile utilizzare l'istruzione di comparazione tra valori: operare sui singoli bit dei valori.

.globl main

.data
	A: .word 42
	B: .word 31

.eqv $a,  $t1  
.eqv $b,  $t2 
.eqv $idx, $t3
.eqv $max, $t4

.text
main:
	# Carico i due valori da confrontare
	la $a, A	
	la $b, B
	li $max, 32

for:
	bge $idx, $max, end
	lb $t9, ($a)
	lb $t8, ($b)

	addi $a, $a, 1
	addi $b, $b, 1

	bgt $t9, $t8, maxA

	bgt $t8, $t9, maxB

	addi $idx, $idx, 1

end:
	li $v0, 10
	syscall					# Fine del programma

maxA:
	li $t0, 0
	move $a0, $t0
	li $v0, 1
	syscall

	j end

maxB:
	li $t0, 1
	move $a0, $t0
	li $v0, 1
	syscall

	j end
