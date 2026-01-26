#-------------------------------------------------------
#--  Pruebas del receptor de la UART del RARs
#--  Probando la funcion uart_wait_rx()
#--  Se espera a que se pulse una tecla, se imprime su
#--  valor y se termina
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
	
	#-- Inicialiar contador
	li s0, 0
	
	#-- Esperar a que se pulse una tecla
	PRINT_STRINGI("Esperando tecla...")
	jal uart_wait_rx
	
	#-- Caracter recibido!!! 
	PRINT_STRINGI("\n")
	PRINT_STRINGI("Caracter RECIBIDO: ")

	#-- Leer el caracter del registro de datos
	lw t0, RX_DATA(gp)
	PRINT_CHARR(t0)
	PRINT_CHARI('\n')

	#-- Terminar	
	EXIT
	

#-------------------------------------------------------
#-- uart_wait_rx()
#--
#--  Esperar hasta que se reciba un caracter
#--
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
	

	