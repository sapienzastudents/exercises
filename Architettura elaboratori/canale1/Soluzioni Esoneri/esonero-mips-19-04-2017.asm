#esonero mips 19/04/2017
#stampa la somma degli elementi di posizione pari meno la somma delgi elementi di posiszione dispari
# $t0 -> x
# $t1 -> y
# $t2 -> num
# $s0 -> somma dei pari
# $s1 -> somma dei pari
.data
x: .word 3,2,-4,6,-1,5,4
y: .word 7

.text
	la $t0,x
	lw $t1,y

start:	lw $t2, 0($t0)
	add $s0,$s0,$t2
	addi $t1,$t1,-1
	beq $t1,0,end
	lw $t2,4($t0)
	add $s1,$s1,$t2
	addi $t0,$t0,8
	addi $t1,$t1,-1
	bne $t1,$0,start

end:	sub $a0,$s0,$s1
	
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	
	
	
	
	 
