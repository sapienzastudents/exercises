# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Si scriva un programma in linguaggio assembler MIPS/MARS che legga da tastiera una serie di numeri interi 
# ﬁno a quando la somma di tutti i numeri introdotti ﬁno a quel momento non supera il valore 1000. 
# A quel punto, il programma stampa il valore del prodotto di tutti i numeri inseriti.
# NB:la stampa deve avvenire da console output del MARS  

.globl main

.data 
	mex : .asciiz "Immetti un altro numero...\n"
	res: .asciiz "Il risultato e': "

.text

main:
	move $t0,$zero      # somma degli interi immessi
	li $t1, 1000 		# limite
	
for:
	bgt $t0,$t1 end
	
	la $a0, mex
	li $v0,4
	syscall 			# stampa la stringa mex
	
	li $v0,5
	syscall 			# legge l'intero
	
	add $t0,$t0, $v0
	j for	
			
end:
	la $a0, res
	li $v0,4
	syscall 			# stampa la stringa mex
			
	move $a0,$t0
	li $v0,1
	syscall
	
	li $v0, 10
	syscall