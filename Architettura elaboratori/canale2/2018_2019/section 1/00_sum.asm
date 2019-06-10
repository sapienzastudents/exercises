# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Implementare il  programma somma di due numeri:
.data 
    pippo: .word 4
    pluto: .word 6

.text
	lw $t0,pippo
	lw $t1,pluto
	add $a0,$t0,$t1
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	