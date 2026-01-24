#-------------------------------------------------------
#--  Pruebas del transmisor de la UART del RARs
#--  Esperar a que el transmisor esté disponible  
#--
#--  Se realiza un bucle de espera donde se esta
#--  constantemente leyendo el bit TX_RDY de
#--  transmisor. Cuando este bit se pone a 1 se imprime
#--  un mensaje
#-------------------------------------------------------


	#-- Servicios del sistema operativo
	.include "so.h"
	
	#--- Direccion base de la UART
	.eqv UART_BASE 0xFFFF0000
	
	#------ Offset de los registros
	#-- Registro de control del transmisor
	.eqv TX_CTRL 0x08
	
	#-- Máscaras de acceso a los bits
	#-- Bit Ready del transmisor
	.eqv TX_READY 0x01  
	
	.text
	
	#-- Direccion de acceso a la uart
	li s0, UART_BASE
	
	
	PRINT_STRINGI("Esperando al transmisor...")
	
	#-- Esperar a que el transmisor este listo
wait_tx:
	#-- Leer el registro de control del transmisor
	lw t0, TX_CTRL(s0)
	
	#-- Aislar el bit TX_READY
	andi t0, t0, TX_READY
	
	#-- Si el bit es 0, el transmisor no esta listo
	#-- repetimos la accion hasta que se ponga a 1
	beq t0, zero, wait_tx
	
	#-- El transmisor está listo!!! 
	PRINT_STRINGI("\n")
	PRINT_STRINGI("Transmisor LISTO!\n")
	
	#-- Terminar
	EXIT
