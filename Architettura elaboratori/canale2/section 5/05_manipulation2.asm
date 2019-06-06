# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Scrivere un programma in linguaggio assembly MARS che legga una stringa introdotta da tastiera. La stringa contiene sia caratteri maiuscoli che caratteri minuscoli, 
# e complessivamente al piu' 100 caratteri. Il programma deve svolgere le seguenti operazioni:
# - visualizzare la stringa inserita
# - costruire una nuova stringa in cui il primo carattere di ciascuna parola nella frase di partenza e' stato reso maiuscolo. Tutti gli altri caratteri devono essere resi minuscoli. 
#    Il programma deve memorizzare la nuova stringa
# - visualizzare la nuova frase.
# Ad esempio la frase "cHe bElLA gIOrnaTa" diviene "Che Bella Giornata".

.globl main

.data
	inp: .space 100
	out: .space 100

.eqv $bit, $t0									# Indica il bit in valutazione
.eqv $source, $t1								# Conterra' indirizzo del valore passato in input
.eqv $dest, $t2								# Conterra' il valore eventualmente modificato dell'input
.eqv $prev, $t3								# Ad ogni valutazione viene salvato in questa variabile il precedente in ordine 
.eqv $stat1, $t4								# Variabile per controllo caratteri
.eqv $stat2, $t5								# Variabile per controllo caratteri

.text

main:
	la $a0, inp									# Indirizzo del buffer
	li $a1,100 										# Limite di caratteri della stringa
	li $v0,8
	syscall											# Leggi la stringa
	
	la $source, inp							# Legge l'indirizzo del vettore sorgente
	la  $dest, out								# Legge l'indirizzo del vettore destinazione
	li $bit, 1										# Valore fittizio per non falsare il test del loop
	li $prev, ' '									# Carichiamo lo spazio vuoto in $prev cosi' anche la prima lettera della frase pu� essere capitalizzata
loop:
	beqz $bit, end
	lb $bit, ($source)
	
	move $a0, $bit
	li $v0, 11
	syscall											# Stampa i bit del vettore originale
	
	# Si setta il valore di base dei controlli
	move $stat1, $zero
	move $stat2, $zero
	
	# si esegue il controllo per vedere se il carattere e' compreso tra 'a' e 'z'
	sge $stat1, $bit, 'a'
	sle $stat2, $bit, 'z'
	and $stat1, $stat1, $stat2
	bnez $stat1, capitalize 				# Se non e' zero allora il valore e' compreso tra 'a' e 'z', quindi richiama capitalize che si occupere' del controllo e della trasformazione 
	
	# Si setta il valore di base dei controlli
	move $stat1, $zero
	move $stat2, $zero
	
	# Si esegue il controllo per vedere se il carattere e' compreso tra 'A' e 'Z'
	sge $stat1, $bit, 'A'
	sle $stat2, $bit, 'Z'
	and $stat1, $stat1, $stat2
	bnez $stat1, minimize					# Se il valore precendente non e' lo spazio allora ci troviamo all'interno di una frase 

normal:
	sb $bit, ($dest)							# Salviamo il carattere senza modificarlo
	
	addi $source, $source, 1 			# Incremento dell'indirizzo per locazione del prossimo bit da caricare	
	addi $dest, $dest, 1 					# Incremento dell'indirizzo per locazione del prossimo bit da salvare
	move $prev, $bit 						# Il bit in esame diventa il bit precedente per i successivi controlli del ciclo
	
	j loop

end:
	la $a0, out
	li $v0, 4
	syscall 											# Stampa la stringa di output
	
	li $v0, 10
	syscall											# Fine del programma

# Questa subroutine effettua un uppercase, ma controlla anche se ci si trova all'inizio di una frase
capitalize:											
	bne $prev, ' ', normal					#Se il precedente non e' uno spazio la lettera non dece essere trasformata e si prosegue con il semblice salvataggio
	subi $bit, $bit, 32
	sb $bit, ($dest)							# Salva il bit nel vettore di destinazione
	
	addi $source, $source, 1 			# Incremento dell'indirizzo per locazione del prossimo bit da caricare	
	addi $dest, $dest, 1 					# Incremento dell'indirizzo per locazione del prossimo bit da salvare
	
	move $prev, $bit 						# Il bit in esame diventa il bit precedente per i successivi controlli del ciclo
	j loop 

# Questa subroutine effettua un lowercase, ma controlla anche se ci si trova all'inizio di una frase	
minimize:
	beq $prev, ' ', normal					# Se il precedente non e' uno spazio la lettera non deve essere trasformata e si prosegue con il semblice salvataggio
	addi $bit, $bit, 32
	sb $bit, ($dest)							# Salva il bit nel vettore di destinazione
	
	addi $source, $source, 1		 		# Incremento dell'indirizzo per locazione del prossimo bit da caricare	
	addi $dest, $dest, 1 					# Incremento dell'indirizzo per locazione del prossimo bit da salvare
	
	move $prev, $bit 						# Il bit in esame diventa il bit precedente per i successivi controlli del ciclo
	j loop
