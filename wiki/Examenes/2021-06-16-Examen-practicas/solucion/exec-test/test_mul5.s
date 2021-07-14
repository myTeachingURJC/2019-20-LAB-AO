#---------------------------------------------------
#- Programa de pruebas para la funcion mul5(x)
#- Creado por: Chuck Norris
#---------------------------------------------------

	#-- Constantes usadas
	.eqv FIN 10
	.eqv IMPRIMIR_ENTERO 1
	.eqv IMPRIMIR_CARACTER 11

	.text
	
	# -- Numero de multiplos de 5 a mostrar
	li s0, 20
	
	
	
# ----------------- ESTE CODIGO NO SE PUEDE MODIFICAR ----------------------------------	
	# -- Contador: 1,2,3....
	li s1, 1
	
bucle:
	beq s0, zero, terminar	
	addi s0, s0, -1
	
	# -- Calcular el siguiente multiplo de 5
	mv a0, s1
	jal mul5
	
	#-- En a0 se encuentra el multiplo
	#-- Lo imprimimos en la consola
	li a7, IMPRIMIR_ENTERO
	ecall
	
	#-- Imprimir un espacio
	li a0, ' '
	li a7, IMPRIMIR_CARACTER
	ecall
	
	#-- Pasar al siguiente multiplo
	addi s1, s1, 1
	b bucle


terminar:
#----------- FIN DEL CODIGO QUE NO SE PUEDE MODIFICAR ------------------

	#-- Terminar
	li a7, FIN
	ecall
	
	
	