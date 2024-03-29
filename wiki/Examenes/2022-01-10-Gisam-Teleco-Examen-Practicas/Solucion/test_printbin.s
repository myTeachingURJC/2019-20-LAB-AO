
	# -- Constantes para los servicios del sistema operativo
	.eqv EXIT         10	
	.eqv PRINT_INT    1
	.eqv PRINT_STRING 4
	
	# -- Constantes indicadas en el enunciado (ESPECIFICACION)
	.eqv VAL_INI 255  #-- Numero inicial
	.eqv VAL_FIN 265  #-- Numero final
	
	.data

		
msg:	.string "--> "	
	
	.text

	#-- Se utiliza el registro estatico s0
	#-- como contador, para no perder su valor
	#-- al llamar a la funcion printbin
	
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
	
	# -- Mientras s0 sea menor o igual que VAL_FIN repetir el bucle
	li t1,VAL_FIN
	ble s0, t1, bucle

	#-- Terminar
	li a7, EXIT
	ecall
