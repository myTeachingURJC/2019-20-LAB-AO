#--------------------------
#-- Programa principal
#-- Imprimir dos rectangulos de asteriscos
#-- en la consola
#--------------------------

	.include "so.s"
	
	.text
	
	#-- Dibujar un rectangulo
	jal rect
	
	#-- Salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Dibujar otro rectangulo
	jal rect

fin:
	#-- Terminar
	li a7, EXIT
	ecall
