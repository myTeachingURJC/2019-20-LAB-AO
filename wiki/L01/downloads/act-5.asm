# Simula este programa
# Fijandote en los valores de los registros...
# ¿Que hace este programa?

	.text
	
	addi x3, x0, 10
a:
	addi x3,x3,-1
	bgt x3,x0, a
	
	li a7, 10
	ecall
