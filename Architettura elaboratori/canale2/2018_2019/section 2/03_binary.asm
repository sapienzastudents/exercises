# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Implementare un programma che legga da input un intero e calcoli il numero di 1 della sua rappresentazione binaria.

# Esempio
# INPUT: 521 (in binario 1000001001)
# OUTPUT: 3

.globl main

.data 
	value: .word 0

.eqv $val, $t0					# Valore della word (intero) passato in input
.eqv $idx, $t1					# Indice per la scansione della word bit a bit
.eqv $bit, $t2					# Bit attualmente in esame
.eqv $res, $t3					# Risultato del numero di bit=1 totali

.text
main:
	li $v0, 5
	syscall   					# Legge intero da input
	move $val, $v0   			# Memorizza il valore letto
	li $idx,32					# Inizializza l'indice
	move $res, $zero			# Setto il risultato a 0

# ciclo per scandire i bit del valore immesso	
repeat:
	andi $bit,$val, 0x80000000  # verifico se il primo bit della stringa sia 1 o 0
	srl $bit,$bit,31			# sposto il bit verificato fino all'ultima posizione 
	
	subi $idx,$idx,1  			# decremento il contatore
	sll $val,$val,1   			# sposto di una cifra la stringa a sinistra quindi ad esempio da 1010 diventa 0100
	bnez $bit, plus  			# Se in bit è uguale ad uno incremento il contatore
	bgtz $idx, repeat

end:
	move $a0,$res
	li $v0,1
	syscall

	li $v0, 10
	syscall
	
plus:
	addi $res,$res,1			# Incremento il totale di 1 trovati nella stringa 
	j repeat