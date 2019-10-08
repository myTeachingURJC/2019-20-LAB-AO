#-- Ejercicio 7: Volcado de memoria
#-- Situar 4 palabras en la memoria y hacer un bucle infinito que la vaya  
#-- recorriendo mostrando en pantalla sus valores
#-- Usar el caracter de salto de linea para separar las palabras


	#-- Códigos de servicio
	.eqv EXIT      10
	.eqv PRINT_INT 1
	.eqv PRINT_CHAR 11

	#-- Segmento de datos
	.data
datos:	.word 1,2,3,4,5,6,7,8,9,10


	.text

	#-- t0 es un puntero al comienzo del segmento de datos
	la t0, datos

	
bucle:			
	#-- Leer palabra
	lw a0, 0(t0)
	
	#-- Imprimir el numero en la consola
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir el salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Incrementar el puntero
	addi t0, t0, 4
	 
	#-- Bucle infinito
	b bucle
	
	
	
