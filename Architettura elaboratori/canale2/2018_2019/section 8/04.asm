# http://arch2.000webhostapp.com/Esercizi.html <-- Sito degli esercizi
# Svolto da Alessio Giovannini

# Si scriva un programma in assembler che realizza il seguente codice: (vedere immagine codefor04.jpg)

.globl main

.data
	mex: .asciiz "Risultato: "

.eqv $a, $t0
.eqv $b, $t1
.eqv $c, $t2
.eqv $d, $t3
.eqv $e, $t4
.eqv $fv, $t5
.eqv $t, $t6

.text

COMPLESSA:
	subi $sp, $sp, 4			# Alloca spazio nello stack per salvare $ra
	sw $ra, 0($sp)				# Salva l'indirizzo di ritorno
	
	div $a, $b
	mflo $e						# a / b
	mfhi $fv							#a % b
	
	jal QUADRATI
	
	lw $ra, 0($sp)				# Recupero indirizzo di ritorno
	addi $sp, $sp, 4			# Libero spazio sullo stack
	jr $ra							# Ritorna al chiamante
	
	
QUADRATI:
	subi $sp, $sp, 4				# Alloca spazio nello stack per salvare $ra
	sw $ra, 0($sp)					# Salva l'indirizzo di ritorno
	
	mul $a, $a, $a					# a = a * a
	mul $b, $b, $b					# b = b * b
	mul $c, $c, $c					# c = c * c
	mul $d, $d, $d					# d = d * d
	mul $e, $e, $e					# e = e * e
	mul $fv, $fv, $fv				# f = f * f
	
	jal MEDIA_QUADRATI
	
	lw $ra, 0($sp)					# Recupero indirizzo di ritorno
	addi $sp, $sp, 4				# Libero spazio sullo stack
	jr $ra								# Ritorna al chiamante

MEDIA_QUADRATI:
	subi $sp, $sp, 4				# Alloca spazio nello stack per salvare $ra
	sw $ra, 0($sp)					# Salva l'indirizzo di ritorno
	
	# t = ( a + b+ c +  d + e + f ) / 6
	add $t, $a, $b
	add $t, $t, $c
	add $t, $t, $d
	add $t, $t, $e
	add $t, $t, $fv
	div $t, $t, 6
	
	jal RADICE_PER_INTERI
	
	lw $ra, 0($sp)					# Recupero indirizzo di ritorno
	addi $sp, $sp, 4				# Libero spazio sullo stack
	jr $ra								# Ritorna al chiamante


RADICE_PER_INTERI:
	mtc1 $t, $f1						# Poniamo in $f1 il valore del quale cerchiamo la radice quadrata
	cvt.s.w $f1, $f1
	sqrt.s $f1, $f1
	abs.s $f1, $f1
	cvt.w.s $f1, $f1
	
	mfc1 $v1, $f1					# Risultato

	jr $ra 								# Ritorna al chiamante


main:
	li $v0, 5
	syscall
	move $a, $v0
	
	li $v0, 5
	syscall
	move $b, $v0
	
	li $v0, 5
	syscall
	move $c, $v0
	
	li $v0, 5
	syscall
	move $d, $v0
	
	jal COMPLESSA					# Chiamata alla funzione
	
	la $a0, mex
	li $v0, 4
	syscall
	
	move $a0, $v1						
	li $v0, 1
	syscall									# Stampa il risultato finale
	
	li $v0, 10
	syscall									# Fine del programma
	