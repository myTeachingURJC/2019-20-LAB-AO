#-- Comparar el valor de dos registros
#-- Si son iguales imprime el mensaje "IGUALES"
#-- Si son diferentes, se imprime "DIFERENTES"
#-- Se utiliza la instruccion bne

	.include "servicios.asm"
	
	#-- Valores constantes a comparar
	.eqv VALOR1 10
	.eqv VALOR2 10
	
	.data
	
	#-- Mensajes a imprimir en la consola
msg_iguales:     .string "IGUALES\n"
msg_diferentes:  .string "DIFERENTES\n"

	.text
	
	#-- Inicializar los registro t0 y t1 con dos valores
	li t0, VALOR1
	li t1, VALOR2
	
	#-- Realizar la comparacion de t0 y t1
	bne t0, t1, diferentes
	
	#-- Son iguales
	la a0, msg_iguales
	li a7, PRINT_STRING
	ecall
	
	#-- Ir al PUNTO DE SALIDA
	j fin
	
	#-- Son diferentes
diferentes:

	la a0, msg_diferentes
	li a7, PRINT_STRING
	ecall

	#-- PUNTO DE SALIDA
fin:	
	#-- Terminar
	li a7, EXIT
	ecall
	
	
	
