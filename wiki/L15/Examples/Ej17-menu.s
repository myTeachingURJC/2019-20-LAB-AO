#-------------------------------------------------------
#--  Ejemplo de un programa que presenta un menu al usuario
#-------------------------------------------------------
	
	#-- Servicios del sistema operativo
	.include "so.h"
	
	
	.data
menu:	.ascii "----MENU-----\n"
        .ascii "1.- Mostrar el menu\n"
        .ascii "2.- Test\n"
        .ascii "q.- Quit\n"
	    .ascii "\nOpcion?: "
	    .byte 0
	
msg_end: .string "\nFin\n"
msg_test: .string "\nProbando la opcion 2...\n\n"

	.text
	 
main:
	
	#-- Configurar el modulo E/S de bajo nivel
	jal io_init

loop:
	#-- Imprimir el menu
	la a0, menu
	jal puts
	
wait_user:
	#-- Esperar a que se pulse una tecla
	jal getchar

	#-- Saltar a la opcion correspondiente
	li t0, '1'
	beq a0, t0, opcion1
	
	li t0, '2'
	beq a0, t0, opcion2
	
	li t0, 'q'
	beq a0, t0, fin
	
	#-- Opcion incorrecta, volver a pedir otra
	j wait_user


	#-- Opcion 1: volver a imprimir el menu
opcion1:
    li a0, '\n'
	jal putchar
	
	li a0, '\n'
	jal putchar
	
	j loop
	
	#-- Opcion 2: Imprimir una cadena de prueba
opcion2:
	la a0, msg_test
	jal puts
	j loop

	#-- Terminar
fin: 	
	la a0, msg_end
	jal puts

    #-- Cerrar la salida de bajo nivel
	jal io_close
	EXIT
	
	
