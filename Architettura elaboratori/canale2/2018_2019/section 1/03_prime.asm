# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Descrivere l'algoritmo  che dato un numero intero maggiore di 2 (definito in memoria) stabilisca se il numero
# è primo (valore 1 in $t2) o no (valore 2 in $t2). Provare ad implementare il programma utilizzando MARS.

# Esempio numeri primi 1,3,5,7,11,13,...

# PS: un numero è primo solo se è divisibile per se stesso e per 1.

.data
	first: .word 17
	second: .word 6
	third: .word 2
	
.text 
main:
	li $t0,2                # start point
	lw $t1, first
	
	for:
		bge $t0,$t1,end
		div $t1,$t0
		mfhi $t3			# resto della divisione
		beqz $t3,not_prime
		li $t2,1
		addi $t0,$t0,1
		j for	
	
	not_prime:
		li $t2, 2
		
	end:
		move $a0, $t2
		li $v0, 1
		syscall
		
		li $v0,10
		syscall
	