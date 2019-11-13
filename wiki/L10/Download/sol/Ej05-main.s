#---------- Programa pricipal

	.include "servicios.asm"
	
	.data
msg:	.string "Introduce un numero: "	
	
	.text
	
	#-- Imprimir cadena
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir numero al usuario
	li a7, READ_INT
	ecall
	
	#-- a0 contiene el numero
	#-- Llamar a operar(a0)
	jal operar
	
	#-- Terminar
	li a7, EXIT
	ecall
	