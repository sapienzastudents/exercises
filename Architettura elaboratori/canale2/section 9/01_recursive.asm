# Si scriva la routine assembler MIPS che implementa la funzione ricorsiva definita come segue:

#    f(x,y) = 1 se uno (almeno) tra x,y vale 0
#    f(x,y) = x * f(y,x-1) altrimenti 

# Si assuma che x, y siano immessi da input sempre maggiori o uguali a 0 

.globl main

.eqv $x, $a0				
.eqv $y, $a1

.text
main:
li $v0, 5
syscall
move $x, $v0 							# Lettura e posizionamento di x

li $v0, 5
syscall
move $y, $v0 							# Lettura e posizionamento di y

jal func									# Chiamata alla funzione ricorsiva

lw $v0, ($sp)							# Recupero del risultato finale

move $a0,$v0
li $v0, 1
syscall										# Stampa il risultato finale

li $v0,10
syscall					   					# Fine del programma

func:
	#salvataggio dei valori
	subi $sp, $sp, 12					# Alloco spazio nello stack per tre elementi
	sw $ra, 0($sp)
	sw $x, 4($sp)
	sw $y, 8($sp) 
	
	beqz $x, cbase 					# Se l'argomento in $a0 è 0 allora ci troviamo nel caso base	
	beqz $y, cbase   					# Se l'argomento in $a1 è 0 allora ci troviamo nel caso base
	
	#swap (scambia la x con la y poichè ad ogni chiamata vanno invertiti)
	subi $t0, $x, 1    					# Decremento di x
	move $x, $y		 
	move $y, $t0
	
	jal func								# Richiamo la funzione con x decrementato
	
	lw $v0, 0($sp)
	lw $ra, 4($sp)
	lw $x, 8($sp)
	lw $y, 12($sp)
	addi $sp, $sp, 16
	
	mul $v0, $x, $v0
	subi $sp, $sp, 4
	sw $v0, ($sp)
	jr $ra
	
	
cbase:
	li $v0,1				   					# Risultato
	addi $sp, $sp, 12					# Recuperiamo lo spazio sullo stack
	subi $sp, $sp, 4					# Aggiungiamo spazio per il risutato
	sw $v0, 0($sp)						# Salviamo il risultato del caso base
	jr $ra				   					# Ritorna al chiamante
