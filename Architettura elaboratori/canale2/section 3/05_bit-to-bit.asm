# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Confrontare due interi positivi a e b, definiti in memoria, e mettere in $t0 il valore 0 se a e' maggiore di b, 
# 1 altrimenti. Non e' possibile utilizzare l'istruzione di comparazione tra valori: operare sui singoli bit dei valori.

.globl main

.data
	A: .word 42
	B: .word 31

.eqv $res,  $t0
.eqv $a,  $t1  
.eqv $b,  $t2 
.eqv $idx, $t7

.text
main:
	lw $a, A
	lw $b, B
	li $idx, 32
	
	andi $t3,$a, 0x80000000			#Valore del bit piu' significativo 
	andi $t4,$b, 0x80000000		#Valore del bit piu' significativo
	
	sne $res, $t3, 0x80000000
	bnez $res, end
	
	seq $res, $t4, 0x80000000
	bnez $res, end  
	
repeat:
	andi $t3,$a, 0x80000000		#Valore del bit piu' significativo 
	andi $t4,$b, 0x80000000		#Valore del bit piu' significativo
	
	beq $t3, 0x80000000, 
	
	
	sll $a, $a,1
	sll $b, $b,1

	seq 

	subi $idx, $idx, 1
	bgtz $idx, repeat

end:
	li $v0, 10
	syscall

bigger:
	move $a0, $res
	li $v0,1
	syscall
	j end






