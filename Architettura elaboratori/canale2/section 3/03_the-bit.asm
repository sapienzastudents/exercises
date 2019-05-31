# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Dato un intero  positivo a definito in memoria, stampare a video "Terzo bit 1" nel caso in cui il terzo bit 
# del numero a sia 1 o  "Terzo bit 0" altrimenti

.globl main

.data
	test1: .word 31 			# In binario 11111

.eqv $val, $t0
.eqv $idx, $t1
.eqv $bit, $t2

.text
main:
	lw $val, test1
	li $idx, 3
	
repeat:
	andi $a0, $val, 0x80000000
	#srl $a0,$bit,31
	li $v0,1
	syscall
	sll $val, $val,1
	subi $idx, $idx,1
	bgtz $idx, repeat

end:
	li $v0,10
	syscall
	
