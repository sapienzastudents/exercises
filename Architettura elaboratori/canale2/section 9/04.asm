# Si scriva la routine assembler MIPS che implementa la funzione ricorsiva definita come segue:

#    f(a,b,c,d) = 1 se a+b+c+d=0
#    f(a,b,c,d) = f(b-1,c,d,a)+a altrimenti

# Si assuma che a,b,c,d siano immessi da input sempre maggiori o uguali a 0 

.globl main

.eqv $a, $a0
.eqv $b, $a1
.eqv $c, $a2
.eqv $d, $a3

.text
main:
	li $v0, 5
	syscall 
	move $a, $v0				# Lettura e salvataggio di a

	li $v0, 5
	syscall 
	move $b, $v0				# Lettura e salvataggio di b
	
	li $v0, 5
	syscall 
	move $c, $v0				# Lettura e salvataggio di c
	
	li $v0, 5
	syscall 
	move $d, $v0 				# Lettura e salvataggio di d 
	
	jal recursion 
	
	lw $v0, ($sp)
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0 ,10
	syscall							# Fine del programma
	
recursion:
	subi $sp, $sp, 20
	sw $ra, 0($sp)
	sw $a, 4($sp)
	sw $b, 8($sp)
	sw $c, 12($sp)
	sw $d, 16($sp)
	
	# Operazioni per verifica del caso base
	move $t0, $zero
	add $t0, $t0, $a
	add $t0, $t0, $b
	add $t0, $t0, $c
	add $t0, $t0, $d
	beqz $t0, cbase			# Se  ci troviamo nel caso base salta
	
	# Inversione condizioni e chiamata ricorsiva 
	# a= b-1, b=c, c=d, d=a
	move $t1, $a
	subi $a, $b, 1
	move $b, $c
	move $c, $d
	move $d, $t1
	jal recursion
	
	# Ripristino dei valori salvati nello stack
	lw $v0, 0($sp)
	lw $ra, 4($sp)
	lw $a, 8($sp)
	lw $b, 12($sp)
	lw $c, 16($sp)
	lw $d, 20($sp)
	addi $sp, $sp, 24				# Libero spazio nello stack
	
	subi $sp, $sp, 4				# Alloco spazio nello stack per salvare il valore di ritorno
	add $v0, $v0, $a	
	sw $v0, ($sp)
	jr $ra

cbase:
	li $v0, 1
	addi $sp, $sp, 20
	subi $sp, $sp, 4
	sw $v0, 0($sp)
	jr $ra
