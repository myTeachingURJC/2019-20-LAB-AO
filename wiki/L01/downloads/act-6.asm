# Simula este programa
# Fijandote en los valores de los registros...
# ¿Que hace este programa?

	.text
	
	addi x5, x0, 5
	addi x6, x0, 6
	addi x7, x0, 0
a:
	beq x5,x0,fin
	add x7, x7, x6
	addi x5, x5, -1
	b a
fin:
	li a7, 10
	ecall
