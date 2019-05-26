# Si scriva la routine assembler MIPS che implementa la funzione ricorsiva definita come segue:

#    f(x,y,z)=8 se x*y*z=0
#    f(x,y,z)=x*y*z*f(z,x,y-1) altrimenti 

# Si assuma che x, y, z siano sempre maggiori o uguali a 0 

.globl main

.eqv $x, $a0
.eqv $y, $a1
.eqv $z, $a2

.text
main:
	li $v0,5
	syscall
	move $x, $v0

	li $v0,5
	syscall
	move $x, $v0
	
	li $v0,5
	syscall
	move $x, $v0