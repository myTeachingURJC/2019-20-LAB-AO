#----------------------------------------
#-- Funcion linea(car)
#--
#-- Dibujar una linea de 5 caracteres
#-- ENTRADAS:
#--   a0: caracter a usar para dibujar la linea
#--
#-- SALIDAS: Ninguna
#----------------------------------------

	.globl linea
	
	#-- Servicios del sistema operativo
	.eqv PRINT_CHAR   11
	
	
	#-- Numero de caracteres en la linea
	.eqv N 5
	
	.text
	
	#-- Punto de entrada de la funcion
linea:

	#-- Contador de caracteres en la linea
	li t0, 0
	
	#-- Comprobar si la linea se ha completado
bucle:
	li t1, N
	beq t0,t1,fin
	
	#-- Imprimir el caracter
	li a7, PRINT_CHAR
	ecall
	
	#-- Incrementar el contador de caracteres
	addi t0,t0,1
	
	b bucle
	
fin:
	#-- Imprimir un salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Retornar
	ret
	
	
	
