## Expresion:  f = 2*a + 4*b - (c - d) + 15

	.text
	
	addi x5, x5, 3  # x5 = a = 3
	addi x6, x6, 5  # x6 = b = 5
	addi x7, x7, 7  # x7 = c = 7
	addi x8, x8, 9  # x8 = d = 9
	
	#-- Calculo de la expresion
	sub x9, x7, x8   #-- x9 = c - d
	add x6, x6, x6   #-- x5 = 2*b
	add x6, x6, x6   #-- x5 = 4*b
	sub x9, x6, x9   #-- x9 = 4*b - (c - d)
	add x5, x5, x5   #-- x5 = 2*a
	add x5, x5, x9   #-- x5 = 2*a + 4*b - (c -d)
	addi x10, x5, 15 #-- x10 = 2*a + 4*b - (c -d) + 15
	
	#-- Terminar
	li a7, 10
	ecall 
	 