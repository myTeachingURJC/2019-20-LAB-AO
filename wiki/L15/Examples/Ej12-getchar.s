#-------------------------------------------------------
#--  Pruebas del receptor de la UART del RARs
#--  Probando la funcion getchar()
#--  Se Leen 2 caracteres introducidos por el usuario
#--   y se termina
#-------------------------------------------------------

	#-- Servicios del sistema operativo
	.include "so.h"
	
	#--- Direccion base de la UART
	.eqv UART_BASE 0xFFFF0000
	
	#---------- Offset de los registros
	#----- Registro de control del receptor
	.eqv RX_CTRL 0x00
	
	#----- Registro de datos del receptor
	.eqv RX_DATA 0x04
	
	#-- Máscaras de acceso a los bits
	#-- Bit Ready del receptor
	.eqv RX_READY 0x01  
	
	
	.text
	
	#-- Direccion de acceso a la uart
	li gp, UART_BASE
	
	#-- Esperar a que se pulse una tecla
	PRINT_STRINGI("Pulsa una tecla: ")
	jal getchar
	
	#-- Imprimir la tecla
	PRINT_CHARR(a0)
	PRINT_CHARI('\n')
	
	#-- Esperar a que se pulse una segunda tecla
	PRINT_STRINGI("Pulsa otra tecla: ")
	jal getchar
	
	#-- Imprimir la tecla
	PRINT_CHARR(a0)
	PRINT_CHARI('\n')

	#-- Terminar	
	EXIT
	
#--------------------------------------------------------
#-- getchar()
#--
#-- Esperar a que se pulse una tecla
#-- Esta funcion es BLOQUEANTE
#--
#-- SALIDA:
#--   a0 (car): Caracter introducido por el usuario
#--
#-- Se supone que el registro gp contiene la direccion
#--   base de la UART
#-------------------------------------------------------
getchar:
	#-- Crear la pila y guardar la direccion de retorno
	addi sp, sp, -16
	sw ra, 12(sp)

	#-- Esperar a que se pulse una tecla
	jal uart_wait_rx
	
	#-- Leer el caracter recibido. Se lee del registro
	#-- de datos del receptor
	lw a0, RX_DATA(gp)

	#-- Recuperar la direccion de retorno y
	#-- liberar la pila
	lw ra, 12(sp)
	addi sp, sp, 16
	ret

#-------------------------------------------------------
#-- uart_wait_rx()
#--
#--  Esperar hasta que se reciba un caracter
#--
#-- Se supone que el registro gp contiene la direccion
#--   base de la UART
#----------------------------------------------------------
uart_wait_rx:

	#-- Crear la pila y guardar la direccion de retorno
	addi sp, sp, -16
	sw ra, 12(sp)
	
	#-- Esperar hasta que se reciba una tecla
wait_rx:
	jal keypressed
	beq a0, zero, wait_rx
	
	#-- Tecla recibida!
	#-- retornar
	
	#-- Recuperar la direccion de retorno y
	#-- liberar la pila
	lw ra, 12(sp)
	addi sp, sp, 16
	ret

#-------------------------------------------------------
#-- keypressed()
#--   Detectar si hay una tecla pulsada
#--
#-- SALIDA:
#--   0: Tecla no pulsada
#--   1: Tecla pulsada
#--
#-- Se supone que el registro gp contiene la direccion
#--   base de la UART
#------------------------------------------------------
keypressed:

	#-- Leer el registro de control del transmisor
	lw a0, RX_CTRL(gp)
	
	#-- Quedarse solo con el bit 0
	andi a0, a0, RX_READY
	
	#-- y devolverlo
	ret
	

	