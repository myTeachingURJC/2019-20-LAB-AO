#-- Solucion al ejercicio 4
#-- Pedir al usuario que introducezca un numero
#-- entero (n).  El programa imprime los numeros
#-- desde el 1 hasta el n, separados por el carater ','

	.include "servicios.asm"
	
	.data
	
msg_pedir_n: .string "Introduce un numero (n): "	
	
	.text
	
	#------ Pedir numero n al usuario
	la a0, msg_pedir_n
	li a7, PRINT_STRING
	ecall
	
	li a7, READ_INT
	ecall
	
	#-- a0 contiene n. Lo guardamos en t1
	mv t1, a0
	
	#-- t0 es el contador
	li t0, 0
	
	
	
	#--- Bucle
bucle:

	#-- Si t0 == n, terminar
	beq t0, t1, fin_bucle

	#-- Incrementar contador
	addi t0, t0, 1
	
	#-- Imprimir el contador
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir el carater de separacion ','
	li a0, ','
	li a7, PRINT_CHAR
	ecall
	
	#-- Repetir
	b bucle
	
fin_bucle:	
	
	#-- Terminar
	li a7, EXIT
	ecall
	