# Si scriva la routine assembler MIPS che implementa la funzione ricorsiva definita come segue:

#    f(x,y,z) = 5 se x,y,z sono tutti 0
#    f(x,y,z) = x * f(z+1,x-2,y) altrimenti 

# Si assuma che x,y,z siano immessi da input sempre maggiori o uguali a 0

.globl main

.eqv $x, $a0
.eqv $y, $a1
.eqv $z, $a2

.text
main:
	li $v0, 5
	syscall
	move $x, $v0 			# Lettura di x

	li $v0, 5
	syscall
	move $y, $v0 			# Lettura di y

	li $v0, 5
	syscall
	move $z, $v0 			# Lettura di z

	jal recursive
	
	lw $v0, ($sp)		   # Recupero valore finale
	move $a0, $v0 
	li $v0,1
	syscall
	
	li $v0, 10
	syscall

recursive:
	subi $sp, $sp, 16
	sw $ra, 0($sp)
	sw $x, 4($sp)
	sw $y, 8($sp)
	sw $z, 12($sp)

	# I seguenti controlli servono per capire se x, y e z sono tutti uguali a 0
	seq $t0, $x, $zero
	seq $t1, $y, $zero
	seq $t2, $z, $zero
	
	and $t0, $t0, $t1
	and $t0, $t0, $t2
	
	bnez $t0, cbase		
	
	# Scambio delle variabili per la funzione(z+1, x-2, y)
	move $t0, $x
	addi $x, $z, 1
	move $z, $y
	subi $y, $t0, 2
	
	jal recursive
	
	lw $v0, 0($sp)
	lw $ra, 4($sp)
	lw $x,  8($sp)
	lw $y,  12($sp)
	lw $z,  16($sp)
	addi $sp, $sp, 20
	
	 mul $v0, $x, $v0
	 subi $sp, $sp, 4
	 sw $v0, ($sp) 
	 jr $ra

cbase:
	li $v0, 5
	addi $sp, $sp, 16
	subi $sp, $sp, 4
	sw $v0, 0($sp)	 
	jr $ra
