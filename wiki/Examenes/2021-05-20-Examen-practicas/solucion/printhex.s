	

#-------------------------------------------
# PrintHex(num)
# Entradas:
#   a0: Numero a imprimir en hexadecimal
# Devuelve:
#   nada
#-------------------------------------------

	.eqv PRINT_CHAR   11
	.eqv PRINT_HEX    34

	.globl printhex
	.text

printhex:
	
	# -- Imprimir numero en hexadecimal
	li a7, PRINT_HEX
	ecall
	
	# -- Imprimir Salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Retornar
	ret
	
