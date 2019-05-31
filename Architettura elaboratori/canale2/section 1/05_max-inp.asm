# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Si scriva un programma in linguaggio assembler MIPS/MARS che acquisisca tre numeri interi da tastiera e:
#   - metta in $t0 del valore maggiore 
# NB: Trascurare il caso in cui i numeri siano uguali  

.globl main

.text

main:
	# Settaggio parametri
	move $t0, $zero
	move $t1, $zero
	li $t2, 3
	
# Ciclo for che riceve input tot volte e controlla il massimo
for:
	beq $t1, $t2, end 
	addi $t1,$t1,1
	li $v0, 5			   # read the integer
	syscall
	
	bgt $v0,$t0,setter
	j for
	
# Setta il nuovo massimo se neccessario
setter:
	move $t0,$v0
	j for

# Fine del programma	
end:
	move $a0, $t0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall