#-------------------------------------------------------
#--  Pruebas del receptor de la UART del RARs
#--  Esperar a que se reciba un caracter por la UART
#--  En cuanto se recibe se termina el programa
#-------------------------------------------------------

	#-- Servicios del sistema operativo
	.include "so.h"
	
	#--- Direccion base de la UART
	.eqv UART_BASE 0xFFFF0000
	
	#---------- Offset de los registros
	#----- Registro de control del receptor
	.eqv RX_CTRL 0x00
	
	#-- Máscaras de acceso a los bits
	#-- Bit Ready del receptor
	.eqv RX_READY 0x01  
	
	
	.text
	
	#-- Direccion de acceso a la uart
	li gp, UART_BASE
	
	PRINT_STRINGI("Esperando caracter...")
	
	#-- Esperar a que el receptor este listo
	#-- Es decir, que reciba una tecla
wait_rx:
	#-- Leer el registro de control del transmisor
	lw t0, RX_CTRL(gp)
	
	#-- Aislar el bit RX_READY
	andi t0, t0, RX_READY
	
	#-- Si el bit es 0, no se ha recibido ningun caracter
	#-- (el receptor NO está listo)
	#-- repetimos la accion hasta que se ponga a 1
	beq t0, zero, wait_rx
	
	#-- Caracter recibido!!! 
	PRINT_STRINGI("\n")
	PRINT_STRINGI("Caracter RECIBIDO!\n")

	#-- Terminar	
	EXIT
	
