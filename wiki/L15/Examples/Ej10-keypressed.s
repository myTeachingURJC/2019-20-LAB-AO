#-------------------------------------------------------
#--  Pruebas del receptor de la UART del RARs
#--  Probando la funcion keypressed()
#--  Se imprimen los numeros enteros, cada segundo
#--  Al apretar una tecla se termina
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
	
bucle:
	#-- Imprimir valor actual del contador
	PRINT_INTR(s0)
	PRINT_CHARI('\n')
	
	#-- Esperar un segundo
	SLEEPI(1000)
	
	#-- INcrementar contador
	addi s0, s0, 1
	
	#-- Si no se ha pulsado una teclar, repetir
	jal keypressed
	beq a0, zero, bucle

	#-- Terminar	
	EXIT
	

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
	

	