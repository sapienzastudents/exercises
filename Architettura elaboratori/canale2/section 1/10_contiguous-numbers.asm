# Si scriva un programma in linguaggio assembler MIPS/MARS che stampa 1 se, 
# in una sequenza di dieci numeri inseriti da tastiera, ci sono almeno due o più numeri consecutivi uguali.
# NB:la stampa deve avvenire da console output del MARS. In caso di esito negativo stampare -1

.globl main

.data
	ins: .asciiz "Insert new number"

.eqv $curr, $t0   # Il numero corrente della sequenza
.eqv $succ, $t1   # Il successivo numero di $curr nella sequenza
.eqv $res, $t2	  # Risultato della ricerca
.eqv $idx, $t3	  # Indice per in numero di input da tastiera

.text
main:
	li $v0,5
	syscall

	# Settaggio parametri
	move $curr,$v0
	li $idx, 1
	li $res, -1
	
repeat:
	beq $idx, 10, end
	addi $idx,$idx,1
	li $v0,5
	syscall
	
	move $succ,$v0 			# Settaggio nuovo numero immesso da tastiera
	bne $curr,$succ,swap    # Se i numeri non sono continui procede con la verifica dei succesivi
	li $res, 1

end:
	move $a0, $res
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	
# -----Functions------
# Rende il $succ il $curr 
swap:
	move $curr, $succ
	j repeat
	
