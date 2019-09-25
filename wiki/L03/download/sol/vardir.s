#-- Cargar las direcciones de las
#-- variables en los registros x5-x8

	#-- Variables en el seg. de datos
	.data
a:	.word 0
b:	.word 0
c:	.word 0
d:	.word 0

	#-- Segmento de código
	.text
	
	#-- Obtener las direcciones
	la x5, a
	la x6, b
	la x7, c
	la x8, d
	
	#-- Terminar
	li a7, 10
	ecall
