# Dato a intero positivo (da 0 a 255) inserito da tastiera, scrivere il valore binario di a al contrario

# Esempio
# INPUT (a): 5 (cioè 00000101)
# OUTPUT: 160 (10100000)

# INPUT (a): 105 (cioè 01101001)
# OUTPUT: 150 (10010110)
	
.globl main

.eqv $val,$t0
.eqv $idx,$t1

.text
main:
	li $v0, 5
	syscall     # Lettura intero da tastiera
	
	move $val,$v0 
	li $idx,32
	
repeat:
	andi $a0,$val,1
	li $v0,1
	syscall
	
	srl $val,$val,1
	subi $idx,$idx,1 #decrementa il contatore
	bnez $idx,repeat

end:
	li $v0,10
	syscall