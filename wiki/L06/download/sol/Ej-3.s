	.include "servicios.asm"

	.data
	
#-- Cadenas con los mensajes a imprimir en cada momento

msg1:	.string "Introduce primer numero: "
msg2:   .string "Introduce el segundo numero: "
msg3:   .string "La suma es: "

	.text
	
	#-- Primer mensaje
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir numero
	li a7, READ_INT
	ecall
	
	#-- Guardar el primer numero en t1
	mv t1, a0
	
	#-- Segundo mensaje
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir numero
	li a7, READ_INT
	ecall
	
	#-- Guardar el segundo numero en t2
	mv t2, a0
	
	#-- Calcular la suma en t3
	add t3, t1, t2
	
	#-- Imprmir mensaje 3
	la a0, msg3
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el resultado final
	li a7, PRINT_INT
	mv a0, t3
	ecall
	
	
	
	#-- Terminar
	li a7, EXIT
	ecall 
	