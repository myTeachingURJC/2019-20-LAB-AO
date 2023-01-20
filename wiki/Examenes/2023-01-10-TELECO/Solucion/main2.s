#----------------------------------
#-- Programa principal:
#----------------------------------

	.include "so.s"

	.data

	#-- Mensajes indicados en la ESPECIFICACION
msg1: 	.string "Introduzca un numero entero: "
msg2:   .string "El cuadruple de "
msg3:   .string " es "

	.text
	
	#------ Pedir un numero al usuario
	#-- Imprmir los mensajes pedidos (ESPECIFICACION) 
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Lectura del numero entero (n)
	li a7, READ_INT
	ecall
	
	#-- a0 contiene el numero introducido por el usuario
	#-- Lo guardamos en s0 para no perderlo
	mv s0, a0
	
	#-- Calcular el doble del numero
	jal cuadruple
	
	#-- a0 contiene el doble
	mv s1, a0  #-- Guardar el doble en s1
	
	#-- Imprimir el resultado:
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el numero original
	mv a0, s0
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir el mensaje 3
	la a0, msg3
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el resultado
	mv a0, s1
	li a7, PRINT_INT
	ecall
	
	
	#-- Terminar
	li a7, EXIT
	ecall 
