# Si scriva la routine assembler MIPS che implementa la funzione ricorsiva definita come segue:

#    f(x,y,z)=8 se x*y*z=0
#    f(x,y,z)=x*y*z*f(z,x,y-1) altrimenti 

# Si assuma che x, y, z siano sempre maggiori o uguali a 0 

.globl main

.eqv $x, $a0
.eqv $y, $a1
.eqv $z, $a2

.text
main:
	li $v0,5
	syscall
	move $x, $v0					 # Leggo e memorizzo il valore di x

	li $v0,5
	syscall
	move $y, $v0					 # Leggo e memorizzo il valore di y
	
	li $v0,5
	syscall
	move $z, $v0					# Leggo e memorizzo il valore di z
	
	jal recursion				   	# Chiamo la funzione
	
	# Al termine della funzione ricorsiva si tornera' qui
	
	lw $v0, ($sp)					# Recupero il valore finale
	move $a0, $v0
	li $v0, 1
	syscall								# Stampo il risultato
	
	li $v0, 10
	syscall								# Fine del programma
	
recursion:
	subi $sp, $sp, 16
	sw $ra, 0($sp)
	sw $x, 4($sp)
	sw $y, 8($sp)
	sw $z, 12($sp)
	
	# Controlli per capire se ci troviamo nel caso base, cioe' se x*y*z = 0
	mul $t0, $x, $y
	mul $t0, $t0, $z
	beqz $t0, cbase				# Se il risultato della moltiplicazione è 0 allora siamo nel caso base e quindi saltiamo
	
	#Se non siamo nel caso base scambiamo le variabili e richiamiamo ricorsivamente la funzione
	#x = z, y=x, z=y-1
	move $t1, $x
	move $x, $z
	subi $z, $y,1
	move $y, $t1
	
	jal recursion					# Chiamata ricorsiva
	
	lw $v0, 0($sp)
	lw $ra, 4($sp)
	lw $x,  8($sp)
	lw	 $y,  12($sp)
	lw	 $z,  16($sp)
	addi $sp, $sp, 20
	
	mul $t0, $x, $y
	mul $t0, $t0, $z
	mul $v0, $t0, $v0
	subi $sp, $sp, 4
	sw $v0, ($sp)
	jr $ra

cbase:
	li $v0, 8						#		Valore da ritornare
	addi $sp, $sp, 16
	subi $sp, $sp, 4
	sw $v0, 0($sp)				# Salva il valore che ritorna alla funzione precedente
	jr $ra