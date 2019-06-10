# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Scrivere un programma in linguaggio assembly MARS che legga una stringa introdotta da tastiera. La stringa contiene sia caratteri maiuscoli che caratteri minuscoli,
# e complessivamente al piu' 255 caratteri. Il programma deve svolgere le seguenti operazioni:
# - visualizzare la stringa inserita
# - stampare a video l'uppercase della stringa
# Ad esempio la frase "Che Bella Giornata" diviene "CHE BELLA GIORNATA".

.globl main 

.data
	userIn : .space 255				# Alloca spazio per 255 caratteri
	up: .space 255						# Alloca spazio per 255 caratteri

.eqv $bit, $t0							# Rappresenta il bit in esame
.eqv $addr, $t1						# Rappresenta l'indirizzo della stringa

.text
main:
	li $a1, 255 							# Massimo numero di carattere possibili in input
	la $a0, userIn						# Input buffer 
	li $v0, 8								# Legge stringa data in input dall'utente
	syscall

	la $addr, userIn					# Carica l'ndirizzo della stringa
	li $bit, 1								# Valore fittizio altrimenti il test del ciclo falsa subito

upper:
	beqz $bit, end						# Se il bit e' zero la stringa e' terminata
	lb $bit, ($addr)					# Leggi un bit del vettore
	
	blt $bit, 'a', ignore				# Ci interessano solo i caratteri tra a e z tutti gli altri non devono essere trasformati
	bgt $bit, 'z', ignore
	
	subi $a0, $bit, 32				# Decrementa il valore ASCII per ottenere la codifica del corrispettivo carattere maiuscolo
	li $v0,11
	syscall									# Stampa il carattere corrispondente al bit

	addi $addr, $addr, 1			# Incrementa l'indirizzo del vettore per selezionare il prossimo bit
	j upper

end:
	li $v0, 10
	syscall
	
ignore:
	move $a0, $bit,
	li $v0, 11
	syscall									# Stampa il carattere senza modificarlo
	
	addi $addr, $addr, 1
	j upper
