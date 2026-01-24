#-------------------------------------------------------
#--  Pruebas del transmisor de la UART del RARs
#--  Se muestra el registro de control del transmisor  
#--
#--  La información se muestra en la consola original
#--  del RARs, cada segundo. El programa no termina nunca
#--  Es necesario detenerlo manualmente
#-------------------------------------------------------


	#-- Servicios del sistema operativo
	.include "so.h"
	
	#--- Direccion base de la UART
	.eqv UART_BASE 0xFFFF0000
	
	#------ Offset de los registros
	#-- Registro de control del transmisor
	.eqv TX_CTRL 0x08
	
	
	.text
	
	#-- Direccion de acceso a la uart
	li s0, UART_BASE
	
	#-- Bucle infinito
bucle:
	#-- Leer el registro de control del transmisor
	lw t0, TX_CTRL(s0)
	
	#-- Imprimir su valor en la consola, 
	#-- a través del sistema operativo
	PRINT_INTR(t0)
	PRINT_CHARI('\n')
	
	#-- Esperar un segundo
	SLEEPI(1000)
	
	#-- Repetir
	j bucle
	

	
