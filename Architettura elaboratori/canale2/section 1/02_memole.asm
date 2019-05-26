# Implementare il seguente programma:
# $t0=1 se il valore della variabile Memole, definita in memoria, 
# ha alla terza posizione meno significativa un 1.
.data
	nl: .asciiz "\n"
	memole_1: .word 42 # in binario 101010 quindi ha 0 come terzo bit meno significativo
	memole_2: .word 36 # in binario 100100 quindi ha 1 come terzo bit meno significativo
	memole_3: .word 4  # in binario 000100 quindi ha 1 come terzo bit meno significativo
.text
main:
	# This test should return zero
	lw $t0, memole_1
	srl $t0,$t0,2
	andi $a0,$t0,1
	li $v0,1
	syscall
	
	jal new_line
	
	# This test should return one
	lw $t0, memole_2
	srl $t0,$t0,2
	andi $a0,$t0,1
	li $v0,1
	syscall
	
	jal new_line
	
	# This test should return one
	lw $t0, memole_3
	srl $t0,$t0,2
	andi $a0,$t0,1
	li $v0,1
	syscall
				
	#end
	li $v0,10
	syscall
	
new_line:
	#Print new line
	la $a0, nl
	li $v0, 4
	syscall
	jr $ra