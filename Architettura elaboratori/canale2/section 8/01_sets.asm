# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# NON COMPLETO

# Si scriva un programma in assembler che definiti due INSIEMI (cioe' due vettori halfword) opera su di essi con tre subroutine
# UNIONE, INTERSEZIONE, DIFFERENZA.
# In particolare:

# UNIONE ha in input  "i due insiemi" (cioe' gli indirizzi dei vettori) e restituisce un "nuovo insieme" 
#        (cioe' l'indirizzo iniziale del vettori) che riporta l'unione dei due insiemi [NB: L'unione fra due insiemi e' l'operazione che 
#        associa ai due insiemi l'insieme i cui elementi appartengono al primo oppure al secondo insieme]
# INTERSEZIONE ha in input "i due insiemi" (cioe' gli indirizzi dei vettori) e restituisce un "nuovo insieme" (cioe' l'indirizzo iniziale 
#              del vettore) che riporta l'intersezione dei due insiemi [NB: L'intersezione fra due insiemi e' 
#              l'operazione che associa ai due insiemi l'insieme i cui elementi appartengono contemporaneamente 
#              al primo e al secondo insieme]
# DIFFERENZA ha in input "i due insiemi" (cioe' gli indirizzi dei vettori) e restituisce un "nuovo insieme" 
#            (cioe' l'indirizzo iniziale del vettore) he riporta la differenza dei due insiemi. [NB: Si definisce differenza fra due 
#            insiemi l'insieme degli elementi del primo insieme che non appartengono al secondo insieme;] 

# ESEMPIO:
# Dati gli insiemi
# A = { 1, 2, 3, 4 }
# B = { 3, 4, 5, 6 }
# A unione B = { 1, 2, 3, 4, 5, 6 }
# A intersezione B = { 3, 4}
# A differenza B = {1, 2}

.globl main

.data
	union: .space 16		# Numero elementi per 2  
	inters: .space 8
	diff: .space 8


    A: .half 1,2,3,4
    B: .half 3,4,5,6
    lenA: .word 4
    lenB: .word 4

.eqv $a, $t0				# Indirizzo del primo vettore
.eqv $b, $t1				# Indirizzo del secondo vettore
.eqv $curr, $t2 			# Indirizzo del vettore in esame (vettore risultato)
.eqv $elA, $t3				# Elemento vettore A
.eqv $elB, $t4     			# Elemento vettore B
.eqv $eq, $t5     			# Segnale di controllo

# La macro ha il compito di inizializzare gli indirizzi dei vettori  
.macro saddr
	la $a, A
	la $b, B
.end_macro

.text
main:
	lw $t7, lenA
	sll $limA, $t7, 1   	 # dimensione N * 2 (perche' lavoriamo con le halfword, se fosse stato un vettore di word era N * 4)
	
	lw $t7, lenB
	sll $limB, $t7, 1
    
    saddr
    jal unione 				 # Chiamata alla subroutine responsabile dell'operazione di unione

	saddr
	jal intersezione 		 # Chiamata alla subroutine responsabile dell'operazione di intersezione
	
	saddr
	jal differenza			 # Chiamata alla subroutine responsabile dell'operazione di differenza

# Subroutine che si occupa dell'operazione di unione
unione:
	lh $elA, ($a)			 # Preleva elemento dall' array di input
	sh $elA, ($curr)		 # Salva l'elemento prelevato nel nuovo array
	
	addi $a, $a, 2		 	 # Incremento del contatore vettore input
	addi $curr, $curr, 2 	 # Incremento del contatore vettore finale
	bge $a0, $limA, unione	
nested_u:
	lh $supp, ($b)


intersezione:
	lh $elA, ($a)			 # Preleva elemento dall' array di input
	j check					 # Chiama la subroutine per vedere se l'elemento in A e' anche in B
cont_i:
	addi $a, $a, 2		 	 # Incremento del contatore vettore input
	addi $curr, $curr, 2 	 # Incremento del contatore vettore finale
	move $eq, $zero			 # Resetta la variabile di controllo
	bge $a0, $limA, unione
	jr $ra
	
check:
	lh $elB, ($b)			 # Preleva elemento dall' array di input B
	bnez $eq, cont_i
	seq $eq, $elA, $elB		 # Se gli elementi sono uguali allora vanno inseriti nel nuovo array
	sh $elA, ($curr) 		 # Salva l'elemento nel array risultato
	addi $b, $b, 2			 # Incrementa l'indirizzo di B 
	j cont_i
	
differenza:
	jr $ra	
	
stampa:
	jr $ra
