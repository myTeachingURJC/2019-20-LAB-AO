#------- Programa principal
#-- Calculo de la secuencia de Fibonacci

	.include "servicios.asm"
	
	.data	
msg1:	.string "Introduce el término de Fibonacci a calcular (>0): "	
msg2:   .string "Resultado: "	
	.text
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall 
	
	#-- Pedir termino a calcular
	li a7, READ_INT
	ecall
	
	#-- Llamar a fibo(n)
	jal fibo
	
	#-- Meter n en s0
	mv s0, a0
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el resultado
	mv a0, s0
	li a7, PRINT_INT
	ecall
	
	li a7, EXIT
	ecall