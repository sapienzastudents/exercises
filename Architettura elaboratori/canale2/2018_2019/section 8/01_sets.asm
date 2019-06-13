# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

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
	union: 		.half 0:8						# Insieme contenente l'unione dei due insiemi
	inters: 	.half 0:4						# Insieme contenente l'intersezione dei due insiemi
	diff: 		.half 0:4						# Insieme contenente la differenza tra i due insiemi

    A: .half 1,2,3,4
    B: .half 3,4,5,6
    lenA: .word 4
    lenB: .word 4
    space: .asciiz " "

.eqv $a, $t0									# Indirizzo del primo vettore
.eqv $b, $t1									# Indirizzo del secondo vettore
.eqv $curr, $t2 							# Indirizzo del vettore in esame (vettore risultato)
.eqv $elA, $t3								# Elemento vettore A
.eqv $elB, $t4     							# Elemento vettore B


# La macro ha il compito di inizializzare gli indirizzi dei vettori  e calcolare la fine
.macro saddr
	la $a, A										# Indirizzo iniziale di A
	la $b, B									# Indirizzo iniziale di B
	
	#Calcolo la fine dei vettori 
	lh $t6, lenA
	sll $t6, $t6, 1
	add $t6, $t6, $a						# Fine di A
	
	lh $t7, lenB
	sll $t7, $t7, 1
	add $t7, $t7, $b						# Fine di B
.end_macro

# Questa macro si occupa di stampare uno spazio
.macro spazio				
	la $a0, space							
	li $v0, 4
	syscall
.end_macro

.macro return
	li $a0, '\n'
	li $v0, 11
	syscall
.end_macro

# Questa macro si occupa della stampa del vettore
.macro print
	sll $t5, $t5, 1
	add $t5, $t5, $curr
	jal stampa
	move $t5, $zero
.end_macro

.text
main:
    la $curr, union					# Preparazione vettore risultato
    saddr									# Chiama la macro
    jal unione 				 			# Chiamata alla subroutine responsabile dell'operazione di unione

	la $curr, union
	print 									# Chiamata alla macro print
	return

	la $curr, inters						# Preparazione vettore risultato
	saddr									# Chiama la macro
	jal intersezione 					# Chiamata alla subroutine responsabile dell'operazione di intersezione
	
	la $curr, inters
	print 									# Chiamata alla macro print
	return
	
	la $curr, diff							# Preparazione vettore risultato
	saddr									# Chiama la macro
	jal differenza			 			# Chiamata alla subroutine responsabile dell'operazione di differenza
	
	la $curr, diff
	print 									# Chiamata alla macro print
	return
	
	li $v0, 10
	syscall									# Fine del programma

# //////////////////////////////////////////////////////////////////////////////////////////////////
# Subroutine che si occupa dell'operazione di unione
unione:			
# La soubroutine si occupa di inserire tutti gli elementi del primo insieme in quello di destinazione
	bge $a, $t6, visit
	lh $elA, ($a)							# Preleva l'elemento
	sh $elA, ($curr)					# Salva l'elemento nell'array di destinazione
	addi $a, $a, 2						# Incremento contatore primo array
	addi $curr, $curr, 2				# Incremento contatore array di destinazione
	addi $t5, $t5,1						# Incremento il contatore che indica quanti sono gli elementi da stampare
	j unione
		
	# Questa subroutine si occupa di controllare gli elementi del secondo vettore e se non sono presenti li aggiunge
	visit:
	la $a, A									# resetto l'indirizzo di A per poterlo riscorrere dall'inizio
	move $a0, $zero
	move $a1, $zero
		inner:
			bge $b, $t7, end_sub
			lh $elB, ($b)					# carico l'elemento in esame
			addi $b, $b, 2				# incremento l'indirizzo  
			
		check_inn:	
			bge $a, $t6, ins_union
			lh $elA, ($a)
			addi $a, $a, 2
			seq $a0, $elB, $elA
			add $a1, $a1, $a0 
			j check_inn
	
	ins_union:
		bgtz $a1, visit					# Se $a1 e' maggiore di 0 allora l'elemento di B e' anche in A e quindi gia' in $curr 
		sh $elB, ($curr)				# Salvo l'elemento di B
		addi $curr, $curr, 2			# Incremento il contatore dell'array risultato
		addi $t5, $t5,1
		j visit
		

# //////////////////////////////////////////////////////////////////////////////////////////////////
intersezione:
	bge $a, $t6, end_sub					# Abbiamo finito il ciclo?
	la $b, B
	lh $elA, ($a)			 						# Preleva elemento dall' array di input
	addi $a, $a, 2								# Incrementiamo l'indirizzo di A
	j check_inters					 			# Chiama la subroutine per vedere se l'elemento in A e' anche in B
	
	ins_inters:
	sh $elA, ($curr) 							# Salva l'elemento nel vettore risultato
	addi $curr, $curr, 2						# Incremento il contatore dell'insieme risultato
	addi $t5, $t5, 1
	la $b, B										# Resetto l'indirizzo di B
	j intersezione
	
	check_inters:
	bge $b,  $t7, intersezione			# Abbiamo terminato il ciclo?
	lh $elB, ($b)									# Carico l'elemento di B
	addi $b, $b, 2								# Incremento l'indirizzo di B
	seq $a0, $elA, $elB						# 1 se gli elementi sono uguali, 0 altrimenti
	bnez $a0, ins_inters					# Se gli elementi sono uguali, inserisci nel insieme risultato
	j check_inters								# ripeto il ciclo sul prossimo elemento
	
# //////////////////////////////////////////////////////////////////////////////////////////////////	
differenza:
	bge $a, $t6, end_sub					# Abbiamo finito il ciclo?
	la $b, B
	lh $elA, ($a)			 						# Preleva elemento dall' array di input
	addi $a, $a, 2								# Incrementiamo l'indirizzo di A
	move $a0, $zero
	move $a1, $zero
	j check_diff	
	
	wdo:
		bgtz $a1, differenza
	ins_diff:
	sh $elA, ($curr) 							# Salva l'elemento nel vettore risultato
	addi $curr, $curr, 2						# Incremento il contatore dell'insieme risultato
	addi $t5, $t5, 1
	la $b, B										# Resetto l'indirizzo di B
	j differenza
	
	check_diff:
	bge $b,  $t7, wdo						# Abbiamo terminato il ciclo?
	lh $elB, ($b)									# Carico l'elemento di B
	addi $b, $b, 2								# Incremento l'indirizzo di B
	seq $a0, $elA, $elB						# 1 se gli elementi sono uguali, 0 altrimenti
	add $a1, $a1,$a0							# Se il risultato sara' 0 allora l'elemento di A non sar� in B
	j check_diff									# ripeto il ciclo sul prossimo elemento
		
end_sub:
	jr $ra									   		# Fine della subroutine
	
stampa:
	bge $curr, $t5,end_print
	lh $a0, ($curr)
	li $v0, 1
	syscall
	addi $curr, $curr, 2
	
	spazio											# Chiamata alla macro spazio
	
	j stampa
	end_print:
		jr $ra
