# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Un utente inserisce da tastiera una serie di numeri interi positivi, 
# ed il termine della serie è indicato dall’inserimento del valore -1. 
# Il programma in linguaggio MIPS, al termine dell’inserimento, 
# stampa quanti numeri in totale sono stati inseriti
# NB:la stampa deve avvenire da consolle output del MARS  

.globl main

.data
	mex: .asciiz "Inserisci un numero: "
	res: .asciiz "Numero di input usati: "

.text

main:
	move $t0, $zero #numero di input inseriti
	li $t1, -1

repeat:
	la $a0, mex
	li $v0, 4
	syscall  #stampa il messaggio
	
	li $v0, 5
	syscall #Legge l'intero
	
	beq $v0, $t1, end
	addi $t0,$t0,1
	j repeat

end:
	la $a0, res
	li $v0, 4
	syscall  #stampa il messaggio
	
	move $a0,$t0
	li $v0,1
	syscall
	
	li $v0, 10
	syscall