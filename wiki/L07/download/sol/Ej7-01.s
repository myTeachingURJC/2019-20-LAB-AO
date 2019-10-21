#-- Solución al ejercicio 7
#-- Calcular al suma de los números introducidor por el usuario

	.include "servicios.asm"
	
	   .data
msg_num:   .string "Introduzca numero: "
msg_total: .string "La suma total es: "
	
	.text
	
	#-- El regitro t0 se contiene a suma de los numeros
	li t0, 0
	
bucle:	
	#-- Pedir numero
	la a0, msg_num
	li a7, PRINT_STRING
	ecall
	
	li a7, READ_INT
	ecall
	
	#-- Si se introduce el 0 se termina
	beq a0, zero, imprimir_total
	
	#-- Sumar el numero
	add t0, t0, a0
	
	#-- Pedir siguiente numero
	b bucle
	
imprimir_total:	

	#-- Imprimir mensaje
	la a0, msg_total
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el total
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall