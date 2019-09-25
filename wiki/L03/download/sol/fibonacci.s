#-- Calcular la sucesion de fibonacci
#-- Almacenarla en el segmento de datos,
#-- en palabras consecutivas

	.data
	
	#-- Valores iniciales de la secuencia de fibonacci
fib0:	.word 0
fib1: 	.word 1


	.text
	
	#-- Puntero para acceder a los datos
	la x5, fib0
	
	#-- Los terminos de Fibonacci estan en los registros x10 y x11
	lw x10, 0(x5)  #-- Primer termino de fibonacci
	lw x11, 4(x5)  #-- Segundo termino de fibonacci
	
	#-- x5 es el puntero hacia el siguiente termino de fibonacci en memoria
	addi x5, x5, 8
	
bucle:
	#-- Obtener el siguiente termino de Fibonacci
	add x12, x10, x11  
	
	#-- Almacenarlo en la memoria, en la direccion apuntada por x5
	sw x12, 0(x5)
	
	#-- Incrementar el puntero x5 para apuntar a la siguiente palabra
	addi x5, x5, 4
	
	#-- Actulizar los terminos anteriores de fibonacci
	mv x10, x11
	mv x11, x12
	
	#-- Repetir
	b bucle
	
	