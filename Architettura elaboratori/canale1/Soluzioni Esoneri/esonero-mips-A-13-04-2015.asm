#stampa il più piccolo numero positivo del vettore
# $s0 -> vettore
# $t0 -> contatore
# $t1 -> num
# $t2 -> usato per slt
# $a0-> min
.data
x:	.word 3,2,-4,6,-1,5,4
n:	.word 7
.text
	la $s0,x 		#load address del vettore
	lw $t0,n		# $t0<-n
	lw $a0,0($s0)		# $a0<-x[0] usando a0 per memorizzare il minimo,
				# lo inizializzo con il primo valore del vettore
	addi $t0,$t0,-1		# decremento contatore
	addi $s0,$s0,4		# mi sposto al secondo valore del vettore
loop:	lw $t1,0($s0)		# carico il secondo valore in t1
	slti $t2,$t1,0		# if (t1<0) { t2=1}
	bne $t2,$0,skip		# if (t2!=0) { j skip)
	slt $t2,$t1,$a0		# if (t1<a0) {t2=1)
	beq  $t2,$0,skip	# if (t2=0) ( j skip)
	move $a0,$t1		# quindi se arriva qui, t1<a0 quindi a0<-t1
skip:	addi $t0,$t0,-1		# decremento contatore
	addi $s0,$s0,4		# mi sposto nel vettore
	bne $t0,$0,loop		# salto a loop finchè non ho finito il vettore
	li $v0,1		# stampo a0 che contiene il minimo
	syscall			#
	li $v0,10		# fine
	syscall			# 
