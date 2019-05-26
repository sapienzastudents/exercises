# Si scriva un programma in linguaggio assembler MIPS/MARS che legga da tastiera i valori delle lunghezze 
# dei tre lati di un triangolo e determina:
#   - se il triangolo è scaleno (porre $t0=0)
#   - se il triangolo è rettangolo (porre $t0=1)
#   - se il triangolo è isoscele (porre $t0=2)
#   - se il triangolo è equilatero (porre $t0=3) 

# NB: non è necessario usare la radice quadra né i numeri in virgola mobile

.globl main

.text

main:
	#Settaggio parametri per il ciclo for
	move $t1,$zero
	li $t2, 3

	
	li $v0,5 
	syscall #legge intero da tastiera
	move $t3,$v0
	
    li $v0,5 
	syscall #legge intero da tastiera
	li $v0,5 
	syscall #legge intero da tastiera	
	
	
end:
	move $a0, $t0
	li $v0, 1
	syscall #Print del tipo di triangolo
	
	li $v0,10
	syscall #Fine del programma

scaleno:
	li $t0,0
	j for 
	
rettangolo:
	li $t0,1
	j for 
isoscele:
	li $t0,2
	j for 

equilatero:
	li $t0,3
	j for 