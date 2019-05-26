.data	
		.word 4			# How many elements to sum
		.word 50,75,112,42	# Integers to sum

.text
		lui $s0, 0x1001		# Array reference
		lw $t0, 0($s0)		# n
		addi $t1, $s0, 4	# Index
		addi $s1, $zero, 0	# Partial sum
	loop: lw $t2, 0($t1)		# Start of loop
		add $s1, $s1, $t2	# Increase sum
		addi $t1, $t1, 4		# Increase pointer to the next word
		addi $t0, $t0, -1	# Decreases n
		bne $t0, $zero, loop	# Jumps to loop while n!=0
		li $v0, 1			# Loads code 1 to register $v0 to print an integer
		add $a0, $a0, $s1	# Loads the sum into arg register $a0
		syscall			# System call
		li $v0, 10
		syscall