#-- Ejemplo de escritura de medias
#-- palabras en memoria


	#-- Código de los servivios del S.O
	.eqv EXIT 10

	.data

	#-- Variable v1: es una media palabra
v1:	.half 0
	
	.text
	
	
	#-- t0: Puntero de acceso a la media palabra
	la t0, v1
	
	#-- Inicializamos t1 con el valor a guardar en memoria
	li t1, 0xDEBE
	
	#-- Almacenar la media palabra en memoria
	sh t1, 0(t0)
	
	#-- Terminar
	li a7, EXIT
	ecall