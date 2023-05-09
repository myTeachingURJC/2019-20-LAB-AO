#--------------------------
# Programa principal       
#--------------------------
#-- Imprimir 20 numeros aleatorios
#----------------------------------

	#-- Servicios del sistema operativo
	.eqv EXIT 10
	.eqv PRINT_INT 1
	.eqv PRINT_CHAR 11
	
	#-- Cantidad de numeros aleatorios a generar
	.eqv N 20
	
	#-- Semilla a utilizar (primer numero de la secuencia)
	.eqv SEMILLA 3
	
	.text
	
	#-- El registro t0 contiene el numero aleatorio
	#-- Inicialmente se comienza con la semilla
	li t0, SEMILLA
	
	#-- En s0 metemos el contador de numeros
	#-- aleatorios
	li s0, N
	
bucle:
	#-- Imprimir numero aleatorio
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir caracter de separacion
	li a0, '-'
	li a7, PRINT_CHAR
	ecall
	
	#-- Calcular el siguiente numero aleatorio
	#-- a partir del actual
	#-- t0 = random(t0)
	mv a0, t0
	jal random
	
	#-- a0 contiene el nuevo numero aleatorio
	#-- Lo metemos en t0
	mv t0, a0
	
	#-- Queda uno menos por generar
	addi s0, s0, -1
	
	#-- Repetir si el contador es distinto de 0
	bne s0, zero, bucle
	
	#-- Llegamos a 0: Hemos terminado!
	
	#-- Terminar
	li a7, EXIT
	ecall
	
