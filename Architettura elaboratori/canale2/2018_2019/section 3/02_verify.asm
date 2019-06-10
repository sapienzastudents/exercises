# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Da svolgere

# Dato il seguente programma, determinare il valore  di risb, rish, risw. 
.globl main

.data
Valore1: .byte 100
Valore2: .byte 250
risb: .byte 0
rish: .half 0
risw: .word 0

.text
main:
	lb $t0,Valore1
	lb $t1,Valore2
	add $t2,$t0,$t1
	sb  $t2,risb
	sh  $t2,rish
	sw  $t2,risw

	li $v0,10
	syscall
# Implementare il codice e verificare la risposta

 
