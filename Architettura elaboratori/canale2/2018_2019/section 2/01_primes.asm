# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Traccia 1. Implementare un programma che:
# stampa a video “Primo numero: ” e prenda in input un numero a
# stampa a video “Secondo numero: ” e prenda in input un numero b
# stampa a video “Prodotto dei due numeri: ” e stampi a video axb

# Esempio
# OUTPUT: Primo Numero:
# INPUT:5
# OUTPUT:Secondo Numero:
# INPUT:6
# OUTPUT: Prodotto dei due numeri:30

.globl main

.data
	first: .asciiz "Primo Numero: "
	second: .asciiz "Secondo Numero: "
	prod: .asciiz "Prodotto dei due numeri: "

.text
main:
	la $a0,first
	li $v0,4
	syscall
	
	li $v0,5 #Legge il primo input
	syscall
	
	move $t0,$v0
	
	la $a0,second
	li $v0,4
	syscall
	
	li $v0,5 #Legge il secondo input
	syscall
	
	move $t1,$v0
	
	mult $t0,$t1
	
	la $a0,prod
	li $v0,4
	syscall
	
	mflo $a0
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	