# Confrontare due interi positivi a e b, definiti in memoria, e mettere in $t0 il valore 0 se a e' maggiore di b, 
# 1 altrimenti. Non e' possibile utilizzare l'istruzione di comparazione tra valori: operare sui singoli bit dei valori.

.globl main

.data
	a: .word 42
	b: .word 31

.eqv $res,  $t0
.eqv $a,  $t1  
.eqv $b,  $t2 

.text
main:
	lw $a, a
	lw $b, b
	
repeat:
	andi $t3,$a, 0x80000000		#Valore del bit più significativo 
	

