#-- Ejemplo de prueba de multiplicacion
#-- Implementacion de la tabla del 9

	.include "so.h"
	.include "stdio.h"
	
	.text
	
	#-- Inicializar contador
	li s0, 0
	
	PRINT_STRINGI("Tabla del 9\n")
	PRINT_STRINGI("-----------\n")
	
bucle:
	#-- Multiplicar 9 * n
	li a0, 9
	mv a1, s0
	jal mul_basic
	mv t0, a0
	
	PRINT_INTI(9)
	PRINT_STRINGI(" * ")
	PRINT_INTR(s0)
	PRINT_STRINGI(" = ")
	PRINT_INTR(t0)
	PRINT_CHARI('\n')
	
	#-- Si n==10, terminar
	li t0, 10
	beq s0, t0, fin
	
	#-- n = n + 1
	addi s0, s0, 1
	
	#-- Repetir
	j bucle
	
fin:
	
	EXIT
	
