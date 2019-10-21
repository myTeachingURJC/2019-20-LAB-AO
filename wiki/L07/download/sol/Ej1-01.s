#-- Solucion Ejercicio 1
#-- Pedir dos numeros al usuario y comprobar si son iguales

	.include "servicios.asm"
	
	.data
	
	         #-- Mensajes a sacar por la consola
msg_iguales:    .string "IGUALES"
msg_no_iguales: .string "DIFERENTES"
msg_num:	.string "Introduce un numero: "

	.text
	
	#-- Pedir los dos numeros al usuario y guardarlos en los
	#-- registros t0 y t1
	
	#-- Print "Introduce un numero"
	la a0, msg_num
	li a7, PRINT_STRING
	ecall
	
	#-- Leer primer entero (t0)
	li a7, READ_INT
	ecall
	mv t0, a0
	
	#-- Print "Introduce un numero"
	la a0, msg_num
	li a7, PRINT_STRING
	ecall
	
	#-- Leer primer entero (t1)
	li a7, READ_INT
	ecall
	mv t1, a0
	
	#----- Realizar la comparacion
	beq t0, t1, iguales
	
	#-- NO son iguales
	la a0, msg_no_iguales
	li a7, PRINT_STRING
	ecall
	
	b fin

	#-- Son iguales
iguales:
	la a0, msg_iguales
	li a7, PRINT_STRING
	ecall	
	
	
	#--- PUNTO DE SALIDA
fin:	li a7, EXIT
	ecall