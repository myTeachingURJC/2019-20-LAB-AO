#-- Solucion ejercicio 4
#-- Lectura de una cadena
#-- Se pide al usuario que introduzca un texto
#-- que luego se imprime en la consola

	#-- Codigo de servicios
	.include "servicios.asm"
	
	#-- Tamaño máximo del texto
	.eqv MAX 1024

	.data
	
	#-- Mensajes de salida
msg1:	.string "Introduce un texto: "
msg2:   .string "Esto es lo que has escrito: \n"

	#-- Texto introducido por el usuario
texto:	.space MAX

	.text
	
	#-- Imprimir mensaje 1 pidiendo un texto
	la a0, msg1
	li a7, PRINT_STRING
	ecall

	#-- Leer texto introducido
	la a0, texto
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir texto introducido por el usuario
	la a0, texto
	li a7, PRINT_STRING
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall
	