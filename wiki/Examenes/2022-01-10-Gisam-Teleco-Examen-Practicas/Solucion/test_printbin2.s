
	# -- Constantes	
	.eqv PRINT_INT    1
	.eqv PRINT_STRING 4
	
	# -- Constantes indicadas en el enunciado (ESPECIFICACION)
	.eqv VAL_INI 255  #-- Numero inicial
	.eqv VAL_FIN 265  #-- Numero final

	.globl test_printbin
			
	.data
		
msg:	.string "--> "	
	
	.text

test_printbin:

	# -- Es una funcion intermedia, por lo que reservamos espacio
	# -- en la pila para guardar la direccion de retorno
	addi sp, sp, -16
	
	# -- Guardar direccion de retorno
	sw ra, 12(sp)

	# -- Guardar el registro S0 para no violar
	# -- el convenio
	sw s0, 0(sp)
	
        # ---------------------------------- Mismo codigo que problema 2 -------------

	#-- Se utiliza el registro estatico s0
	#-- como contador, para no perder su valor
	#-- al llamar a la funcion printhex

	# -- ESPECIFICACION ENUNCIADO: Valor inicial
	li s0, VAL_INI
	
	

bucle:
	# -- ESPECIFICACION ENUNCIADO: Imprimir el numero en decimal
	mv a0, s0
	li a7, PRINT_INT
	ecall

	# -- ESPECIFICACION ENUNCIADO: Imprimir cadena "--> "
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	# -- ESPECIFICACION ENUNCIADO: Imprimir en binario
	mv a0, s0
	jal printbin
	
	# -- Incrementar el numero
	addi s0, s0, 1
	
	# -- Mientras s0 sea menor que VAL_FIN repetir el bucle
	li t1, VAL_FIN
	ble s0, t1, bucle

       # ------------------  Hasta aqui mismo codigo que problema 2 ------------

	# -- Recuperar el valor de S0
	lw s0, 0(sp)

	# -- Recuperar direccion de retorno de la pila
	lw ra, 12(sp)
	
	# -- Recuperar el valor original del sp
	addi sp, sp, 16
	
	#-- Retornar
	ret










	
