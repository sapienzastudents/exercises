# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Implementare il seguente programma:
# $t0=1 se il valore della variabile definita in memoria Batman è maggiore del valore della 
# variabile definita in memoria Robin.

.data 
	batman: .word 5
	robin: .word 3
.text	
	lw $t1,batman
	lw $t2,robin
	slt $a0, $t1,$t2
	
	li $v0,1
	syscall
		
	li $v0,10
	syscall
		