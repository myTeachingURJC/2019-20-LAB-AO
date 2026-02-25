#-- Ejemplo de prueba de multiplicacion
#-- de un numero grande

	.include "so.h"
	.include "stdio.h"
	
	.text
	
	#-- Numeros a multiplicar
	li s0, 0x10000
	li s1, 0xFFFF
	
	#-- Imprimir operacion a realizar
	PRINT_INT_HEXR(s0)
	PRINT_STRINGI(" * ")
	PRINT_INT_HEXR(s1)
	PRINT_STRINGI(" = ")
	
	#-- Realizar la multiplicacion
	mv a0, s0
	mv a1, s1
	jal _mul
	mv t0, a0
	
	#-- Imprmir resultado
	PRINT_INT_HEXR(t0)
	PRINT_CHARI('\n')
	
	EXIT
	
