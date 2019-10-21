#-- Ejemplo de uso de bucles
#-- El programa imprime los números de 1 al 10
#-- en la consola y termina

	.include "servicios.asm"
	
	#-- Valor maximo del contador
	.eqv MAX 10
	
	#-- Caracter de salto de linea (\n)
	.eqv LF 10
	
	.text
	
	#-- t0 lo usamos de contador: 1,2,3,4...
	li t0, 0
	
bucle:
	#-- Incrementar el contador
	addi t0, t0, 1
	
	#-- Imprimir su valor
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir '\n' para separar los numeros
	li a0, LF
	li a7, PRINT_CHAR
	ecall
	
	#-- Si t0 < MAX repetir
	li t1, MAX
	blt t0, t1, bucle
	
	#-- Terminar
	li a7, EXIT
	ecall