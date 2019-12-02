##-- Ejemplo de subrutina
##-- Funcion para devolver el incremento de su parámetro

	.include "servicios.asm"

	#-- Valor a incrementar
	.eqv VALOR 2

	.text
	
	#-- Imprimir el valor original
	li a0, VALOR
	li a7, PRINT_INT
	ecall
	
	#-- Llamar a la subrutina de incrementar
	li a0, VALOR
	jal inc
	
	#-- Guardar a0 en t0
	mv t0, a0
	
	#-- Imprimir '\n'
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Imprimir el valor incrementado
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall

#--------------------------------------------
#-- SUBRUTINA
#--------------------------------------------
inc:
	
	addi a0, a0, 1
	
	ret
	



