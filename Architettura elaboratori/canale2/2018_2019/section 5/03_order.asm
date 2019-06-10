# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Scrivere un programma in linguaggio assembly MARS che riceve in ingresso una sequenza di N numeri interi.
# I numeri sono memorizzati in un vettore. Il valore N e' inserito dall'utente prima della lettura del vettore,
# ma il vettore puo' contenere al massimo 30 numeri. Terminato l'inserimento della sequenza di numeri,
# il programma deve verificare se il vettore contiene una sequenza di numeri ordinata in modo strettamente crescente.
# ESEMPIO
# INPUT 5 - 3;5;8;10;22
# OUTPUT: ORDINAMENTO STRETTAMENTE CRESCENTE
# INPUT 5 - 3;5;8;22;10
# OUTPUT: ORDINAMENTO CASUALE
 
.globl main
 
.data
 	arr:.space 120             		#Il vettore puo' contenere massimo 30 elementi (4 byte per elemento)
    grown: .asciiz "ORDINAMENTO STRETTAMENTE CRESCENTE"
    casual: .asciiz "ORDINAMENTO CASUALE"
    N: .asciiz  "Inserire il numero che indichera' la lunghezza del vettore (max 30)"
 
.eqv $i, $t0                    	# Contatore (rappresenta l'indice di scansione per la preparazione del vettore)
.eqv $idx, $t1                  	# Indice calcolato con l'offset
.eqv $lim, $t2                  	# Numero di elementi che l'utente vuole inserire
.eqv $stat, $t3                     # 1 se l'ordine e' crescente 0 altrimenti
.eqv $prev, $t4                 	# elemento del vettore precedente a quello correntemente in esame
 
.text
main:
la $a0,N
li $v0,4
syscall                        	 	# Stampa messaggio di inizio
 
li $v0,5
syscall                             # Legge N
 
move $lim,$v0           	        # Imposta il limite del numero di element dell' array in input
   
move $i, $zero 
move $prev, $zero
 
read:
    beq $i, $lim, result        	# Ciclo for i=0 to max
    li $v0, 5
    syscall                    		# Legge input da tastiera
   
    sll $idx, $i, 2             	# Calcolo dell'offset per accede al vettore
    sw $v0, arr($idx)           	# Salvataggio dato letto nel vettore        
    addi $i,$i, 1               	# Incrementa il contatore base
   
    slt $stat, $prev, $v0           # Se il precedente e' piu' piccolo setta 1
    move $prev, $v0
    j read     
   
result:
    beqz $stat, nresp
    la $a0, grown
    li $v0, 4
    syscall
    j end
   
nresp: 
    la $a0, casual
    li $v0, 4
    syscall
    j end
 
end:
    li $v0, 10
    syscall
