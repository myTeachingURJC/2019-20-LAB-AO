# ------------------------------------------------
# Funcion para imprimir un vector
#
# printv (x,y)
#
# ENTRADAS:
#   a0: Coordenada x del vector a imprimir
#   a1: Coordenada y del vector a imprimir
#
# SALIDAS:
#
#   -No devuelve nada.
#   -Se imprime el vector en la consola
#----------------------------------------------
#- Autor: Chuck Norris
#----------------------------------------------
# NO PUEDES MODIFICAR NADA DE ESTE PROGRAMA!!
# (porque lo ha hecho Chuck Norris)
#----------------------------------------------

	.globl printv
	
	# -- Servicios del sistema operativo
	.eqv PRINT_INT 1
	.eqv PRINT_CHAR 11
	
	.text
	
printv:

	# -- Guardar a0 en t0 para no perderlo
	mv t0, a0
	
	# -- Imprimir paréntesis de apertura
	li a0, '('
	li a7, PRINT_CHAR
	ecall
	
	# -- Imprimir componente x, que se recibio por a0
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	# -- Imprimir una ',' de separacion
	li a0, ','
	li a7, PRINT_CHAR
	ecall
	
	# -- Imprimir componente y, que se recibio por a1
	mv a0, a1
	li a7, PRINT_INT
	ecall
	
	# -- Imprimir parentesis de cierre
	li a0, ')'
	li a7, PRINT_CHAR
	ecall
	
	# -- Imprimir salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall

	#-- Retornar
	ret
	
	
