
	# -- Constantes	
	.eqv PRINT_INT    1
	.eqv PRINT_STRING 4

	.globl test_printhex
			
	.data
		
msg:	.string ": "	
	
	.text

test_printhex:

	# -- Es una funcion intermedia, por lo que reservamos espacio
	# -- en la pila para guardar la direccion de retorno
	addi sp, sp, -4
	
	# -- Guardar direccion de retorno
	sw ra, 12(sp)

	# -- Guardar registros estaticos
	# -- para no violar el convenio
	sw s0, 0(sp)
	sw s1, 4(sp)

	# ---------------------------------- Mismo codigo que problema 2 -------------

	#-- Se utiliza el registro estatico s0
	#-- como contador, para no perder su valor
	#-- al llamar a la funcion printhex
	
	# -- ESPECIFICACION ENUNCIADO: Valor inicial
	li s0, 10
	
	# -- Valor usado para repetir el bucle
	# -- y obtener los numeros del 10 al 15
	li s1, 16

bucle:
	# -- ESPECIFICACION ENUNCIADO: Imprimir el numero en decimal
	mv a0, s0
	li a7, PRINT_INT
	ecall

	# -- ESPECIFICACION ENUNCIADO: Imprimir cadena ": "
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	# -- ESPECIFICACION ENUNCIADO: Imprimir en hexadecimal
	mv a0, s0
	jal printhex
	
	# -- Incrementar el numero
	addi s0, s0, 1
	
	# -- Mientras s0 sea menor que 16 repetir el bucle
	blt s0, s1, bucle

	# ------------------  Hasta aqui mismo codigo que problema 2 ------------

	# -- Recuperar el valor de S0 y s1
	lw s0, 0(sp)
	lw s1, 4(sp)

	# -- Recuperar direccion de retorno de la pila
	lw ra, 12(sp)
	
	# -- Recuperar el valor original del sp
	addi sp, sp, 4
	
	#-- Retornar
	ret
