#-- Ejemplo de uso del servicio PrintINT para
#-- sacar un entero por la consola

	#-- Servicio Print_Int
	.eqv PRINT_INT 01
	
	#-- Servicio Exit
	.eqv EXIT 10

	.text
	
	#-- Imprimir un numero
	li a0, 200
	
	#-- Invocar el servicio print_int
	li a7, PRINT_INT
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall