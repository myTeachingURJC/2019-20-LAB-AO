	

#-------------------------------------------
# PrintBin(num)
# Entradas:
#   a0: Numero a imprimir en binario
# Devuelve:
#   nada
#-------------------------------------------

	.eqv PRINT_CHAR   11
	.eqv PRINT_BIN    35

	.globl printbin
	.text

printbin:

	#-- Es una funcion hoja. No es necesario guardar
	#-- la direccion de retorno en la pila
	
	# -- Imprimir numero en binario
	li a7, PRINT_BIN
	ecall
	
	# -- Imprimir Salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
    # -- 

	#-- Retornar
	ret
	
