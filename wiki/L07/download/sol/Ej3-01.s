#-- Solucion al ejericio 3: Menu con 2 opciones

	.include "servicios.asm"

	.data
	#-- Definicion de las cadenas con los mensajes a sacar
menu_str:  .string "\n\nMenu de opciones\n================\n1. Incrementar contador\n2.Exit\n\nOpcion? :"
cont_str:  .string "\nContador: "
error:     .string "\nERROR: Opcion invalida"
exit_str:  .string "\nEXIT: Terminando el programa\n"

	.text
	
	#-- t2 lo usamos como contador
	li t2, 0
	
	#-- Bucle principal
menu:	
	#-- Imprimir el menu
	la a0, menu_str
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir la opcion al usuario. Usamos el servicio READ_CHAR porque es
	#-- una especificación del enunciado
	li a7, READ_CHAR
	ecall
	
	#-- a0 contiene la opcion elegida, como caracter
	
	
	#-- ¿Es la opcion 1?
	li t0, '1'
	beq a0, t0, opcion1
	
	#-- ¿Es la opcion 2?
	li t0, '2'
	beq a0, t0, opcion2
	
	#-- Si llega aqui es que es una opcion incorrecta
	#-- Imprimir mensaje error y volver al menu
	la a0, error
	li a7, PRINT_STRING
	ecall
	
	#-- volver el menu
	b menu
	
	#-- Opcion 1:  Incrementar el contador e imprimir su valor
opcion1:
	#-- Incrementar el contador
	addi t2, t2, 1

	#------- Mostrar el valor del contador: "Contador: "
	la a0, cont_str
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir valor del contador
	li a7, PRINT_INT
	mv a0, t2
	ecall
	
	#-- Volver al comienzo para sacar el menu
	b menu
	
	#-- Opcion 2: Terminar
opcion2:
	#-- Imprimir mensaje de fin
	la a0, exit_str
	li a7, PRINT_STRING
	ecall	
	
	#-- PUNTO DE SALIDA
fin:	li a7, EXIT
	ecall
