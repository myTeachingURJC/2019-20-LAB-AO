# Solucio actividad 5
# Se trata de una cuenta atras
# El registro x3 comienza en 10 y se vall decrementando:
#  x3:  10, 9, 8, 7, 6...3,2,1, 0
# Cuando llega a 0 termina

	.text
	
	addi x3, x0, 10
a:
	addi x3,x3,-1
	bgt x3,x0, a
	
	li a7, 10
	ecall
