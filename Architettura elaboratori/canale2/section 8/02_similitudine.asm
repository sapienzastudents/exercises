# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Si scriva un programma in assembler che legge due stringhe da tastera e al suo interno usa una subroutine, denominata SIMILITUDINE, 
# che valuta quanti caratteri alle stesse posizioni delle due stringhe sono uguali.
# La routine riceve due parametri, "le stringhe" (cioe' gli indirizzi delle stringhe), e restituisce un numero intero e lo stampa a video.
# Ad esempio:

#    SIMILITUDINE ("ciao", "cielo") restituisce 2 in quanto i primi due caratteri sono identici.
#    SIMILITUDINE("ciao", "salve") restituisce 0 in quanto nessun carattere alle stesse posizioni sono uguali

.globl main

.data
	first: .space 50					# Prima stringa in input
	second: .space 50				# Seconda stringa in input

.eqv $count,  $t0					# Contatore caratteri uguali
.eqv $f_bit, 	  $t1					# Carattere della prima stringa
.eqv $s_bit, 	  $t2					# Carattere della seconda stringa
.eqv $f_addr, $t3					# Indirizzo della prima stringa
.eqv $s_addr, $t4					# Indirizzo della seconda stringa

.text
main:
	li $a1, 50								# Massimo di caratteri inseribili

	li $v0, 8
	la $a0, first
	syscall									# Legge e salva la prima stringa
	
	li $v0, 8
	la $a0, second
	syscall									# Legge e salva la seconda stringa
	
	la $f_addr, first					# Caricamento della prima stringa
	la $s_addr, second				# Caricamento della seconda stringa
	
SIMILITUDINE:
	lb $f_bit, ($f_addr)
	lb $s_bit, ($s_addr)
	
	beq $f_bit, 10, end				# Se il carattere è quello terminatore abbiamo finito la stringa
	beq $s_bit, 10, end				# Se il carattere è quello terminatore abbiamo finito la stringa
	
	seq $t5, $f_bit, $s_bit			# 1 se i caratteri nella stessa posizione sono uguali, 0 altrimenti
	add $count, $count, $t5		# Aggiorna il contatore
	
	addi $f_addr, $f_addr, 1		# Aggiornamento dell'indirizzo
	addi $s_addr, $s_addr, 1		# Aggiornamento dell'indirizzo della seconda stringa
	j SIMILITUDINE
	
end:
	move $a0, $count
	li $v0, 1
	syscall									# Stampa il valore del contatore
	
	li $v0,10
	syscall									# Fine del programma
