#-- Ejercicio 1
#-- Inicializacion de los registros x5-x8
#-- Transferencia a los registros x15-x18

#-- Para inicializar los registros y hacer
#-- transferencias no necesitamos usar
#-- el segmento de datos. El enunciado no
#-- nos expecifica que los valores de inicializacion
#-- deban estar almacenados en memoria

#-- Por tanto, solo hay segmento de codigo
#-- y NO de datos

	.text
	
	#-- Inicializar los registros
	li x5, 5
	li x6, 6
	li x7, 7
	li x8, 8
	
	#-- Transferir los valores a los
	#-- registros x15-x18
	mv x15, x5
	mv x16, x6
	mv x17, x7
	mv x18, x8
	
	#-- Terminar
	#-- ¡OJO! se modifica el registro x17
	li a7, 10
	ecall
	