# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Dato un intero  positivo a definito in memoria, stampare a video "Terzo bit 1" nel caso in cui il terzo bit 
# del numero a sia 1 o  "Terzo bit 0" altrimenti

.globl main

.data
	test1: .word 31 			# In binario 11111
	test2: .word 26			# In binario 11010
	test3: .word 16			# In binario 10000
	test4: .word 69			# In binario 1000101

.eqv $val, $t0
.eqv $idx, $t1
.eqv $bit, $t2

.text
main:
	lw $val, test4
	li $idx, 1
	
	andi $val, $val, 4
	seq $a0, $val, 4
	li $v0,1
	syscall

end:
	li $v0,10
	syscall
	
